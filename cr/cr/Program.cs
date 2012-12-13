using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Data.OracleClient;
using System.Data;
using System.Diagnostics;


public static class DatabaseSQL
{
    static OracleConnection ConnectionDB(string SID, string User, string Password)
    {
        string strConn = "Data Source=" + SID + "; User ID=" + User + "; Password=" + Password + ";Unicode=true";
        OracleConnection Connection;
        try 
        {
            Connection = new OracleConnection();
            Connection.ConnectionString = strConn;
            Connection.Open();
        }
        catch (Exception ex)
        {
            throw new Exception(strConn + "\n" + ex.Message + "\n" + ex.StackTrace);
        }
        return Connection;
    }

    static public void CheckAndCreateTableVersion(string SID, string User, string Password)
    {
        OracleConnection Connection;
        try
        {
            Connection = ConnectionDB(SID, User, Password);
            OracleCommand Command = new OracleCommand("SELECT * FROM USER_TABLES WHERE TABLE_NAME like 'VERSIONS'", Connection);
            OracleDataAdapter DataAdapter = new OracleDataAdapter(Command);
            DataTable Table = new DataTable();
            DataAdapter.Fill(Table);
            if (Table.Rows.Count == 0)
            {
                string Query = "create table VERSIONS (NAME    VARCHAR2(255) not null ) ";

                OracleCommand cmdInsert = new OracleCommand(Query, Connection);
                cmdInsert.CommandType = CommandType.Text;
                cmdInsert.ExecuteNonQuery();

            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message + "\n" + ex.StackTrace);
        }
    }

    static public string GetLastVersion(string SID, string User, string Password)
    {
        OracleConnection Connection;
        try
        {
            Connection = ConnectionDB(SID, User, Password);
            OracleCommand Command = new OracleCommand("SELECT NAME FROM (SELECT NAME FROM VERSIONS ORDER BY NAME DESC) WHERE rownum=1 ", Connection);
            OracleDataAdapter DataAdapter = new OracleDataAdapter(Command);
            DataTable Table = new DataTable();
            DataAdapter.Fill(Table);
            if (Table.Rows.Count > 0)
            {
                return Table.Rows[0]["NAME"].ToString();
            }
            else
            {
                return "0";
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message + "\n" + ex.StackTrace);
        }        
    }

    static public void VersionUP(string SID, string User, string Password, string strVer, string strQuery = null)
    {
        OracleConnection Connection;
        OracleTransaction Transaction = null ;
        try
        {
            Connection = ConnectionDB(SID, User, Password);
                        
            OracleCommand Command = new OracleCommand();
            Command.Connection = Connection;
            Command.CommandType = CommandType.Text;


            Transaction = Connection.BeginTransaction(System.Data.IsolationLevel.ReadCommitted);
            Command.Transaction = Transaction;

            if (strQuery != null)
            {
                string[] cmd = strQuery.Split(new Char[] { ';' });

                foreach (string com in cmd)
                {
                    if (com == "" )
                        continue;
                    Command.CommandText = com;
                    Console.WriteLine(com);
                    Command.ExecuteNonQuery();
                }
            }

            if (strVer != "")
            {
                string Query = "INSERT INTO VERSIONS(NAME) VALUES(" + strVer + ")";
                Command.CommandText = Query;
                Command.ExecuteNonQuery();
            }

            Transaction.Commit();

        }
        catch (Exception ex)
        {
            Transaction.Rollback();
            throw new Exception(ex.Message + "\n" + ex.StackTrace);
        }
    }

    static public bool CheckVersionInDatabase(string SID, string User, string Password, string strVer)
    {
        OracleConnection Connection;
        try
        {
            Connection = ConnectionDB(SID, User, Password);
            string strSQL = "SELECT NAME FROM VERSIONS WHERE NAME='" + strVer + "' ORDER BY NAME DESC  ";
            
            OracleCommand Command = new OracleCommand(strSQL, Connection);
            OracleDataAdapter DataAdapter = new OracleDataAdapter(Command);
            DataTable Table = new DataTable();
            DataAdapter.Fill(Table);
            if (Table.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message + "\n" + ex.StackTrace);
        }

    }


}


interface ICommand
{
    string Is();
    string Run(string[] args);
    string Help();
}

public static class CommandBase 
{
    static public string DIRMAIN = "CR";
    static public string DIRMIGRATE = DIRMAIN+"\\migrate";
    static public string DATABASE = DIRMAIN + "\\" + "database.ini";
    static public string INIT = DIRMAIN + "\\" + "init.ini";

    
    public static void DIRMAIN_INIT()
    {
        if (!Directory.Exists(DIRMAIN))
        {
            DirectoryInfo dir = new DirectoryInfo(DIRMAIN);
            dir.Create();            
        }
    }

    public static void DIRMIGRATE_INIT()
    {
        if (!Directory.Exists(DIRMIGRATE))
        {
            DirectoryInfo dir = new DirectoryInfo(DIRMIGRATE);
            dir.Create();
        }
    }
    
}

public class CommandAdd : ICommand
{
    public string Is()
    {
        return "add";
    }

    public string Run(string[] args)
    {
        string strResult="";
        if (args.Length == 2)
        {
            if (args[1] == "help")
                return Help();
        };

        CommandBase.DIRMAIN_INIT();
        CommandBase.DIRMIGRATE_INIT();

        if (args.Length == 2)
        {
            args[1].Trim();
            if (args[1].Length > 0)
            {
                string strName = String.Format("{0:yyyyMMddHHmmss}", DateTime.Now) + "_" + args[1];
                DirectoryInfo theDir = new DirectoryInfo(CommandBase.DIRMIGRATE + "\\" + strName);
                theDir.Create();

                FileInfo theFileUp = new FileInfo(CommandBase.DIRMIGRATE+"\\"+strName+"\\Up.sql");
                theFileUp.Create();

                FileInfo theFileDown = new FileInfo(CommandBase.DIRMIGRATE + "\\" + strName+"\\Down.sql");
                theFileDown.Create();

                strResult += strName;
            }
            else
            {
                return "Укажите имя миграции";
            }
        }
        else
        {
            return "Укажите имя миграции";
        }

        strResult += "\nВыполнено";
        return strResult;
    }

    public string Help()
    {
        string strHelp;
        strHelp = "Команда add - создать файл миграции. Миграция - скрипт на изменение";
        return strHelp;
    }
}


public class CommandMigrate : ICommand
{
    public string Is()
    {
        return "migrate";
    }

    public string Run(string[] args)
    {
        string strResult = "";
        if (args.Length == 2)
        {
            if (args[1] == "help")
                return Help();
        };


        if (!File.Exists(CommandBase.DATABASE))
        {
            return "Файл " + CommandBase.DATABASE + " не существует. Создайте командой init";
        }

        AMS.Profile.Ini Init = new AMS.Profile.Ini(CommandBase.INIT);
        string db = Init.GetValue ("DATABASE", "db", "");
        string oracle = Init.GetValue("DATABASE", "oracle", "");

        AMS.Profile.Ini database = new AMS.Profile.Ini(CommandBase.DATABASE);
        string SID = database.GetValue(db, "SID", "");
        string USER = database.GetValue(db, "USERNAME", "");
        string PASSWORD = database.GetValue(db, "PASSWORD", "");

        if (oracle == "")
        {
            return "Укажите в файле " + CommandBase.DATABASE + " строку oracle=<path_to_sqlplus.exe>";
        }
                        
        try
        {
            DatabaseSQL.CheckAndCreateTableVersion(SID, USER, PASSWORD);            
        }
        catch (Exception ex)
        {
            string err = ex.Message + "\n" + ex.StackTrace;
            return err;
        }

        DirectoryInfo source = new DirectoryInfo(CommandBase.DIRMIGRATE);
        DirectoryInfo[] dirs = source.GetDirectories();
        foreach (DirectoryInfo dir in dirs)
        {
            if (DatabaseSQL.CheckVersionInDatabase(SID, USER, PASSWORD, dir.Name.Substring(0, 14)) == false)
            {
                ProcessStartInfo ProcessInfo;
                Process Process;
                string strParam = USER + "/" + PASSWORD + "@" + SID + " @" + CommandBase.DIRMIGRATE + "\\" + dir.Name + "\\Up.sql";
                Console.WriteLine(strParam);
                ProcessInfo = new ProcessStartInfo(oracle + "\\sqlplus.exe", strParam);
                ProcessInfo.CreateNoWindow = false;
                ProcessInfo.UseShellExecute = false;
                //ProcessInfo.RedirectStandardOutput = true;
                Process = Process.Start(ProcessInfo);
                Process.WaitForExit();
                int ExitCode = Process.ExitCode;
                Process.Close();
                
                try
                {
                    DatabaseSQL.VersionUP(SID, USER, PASSWORD, dir.Name.Substring(0, 14));
                }
                catch (Exception ex)
                {
                    string err = ex.Message + "\n" + ex.StackTrace;
                    return err;
                }
                Console.WriteLine(dir.Name.Substring(0, 14));
            }
        }

        strResult += "\nВыполнено";
        return strResult;
    }

    public string Help()
    {
        string strHelp;
        strHelp = "Команда migrate - выполнить миграции в БД";
        return strHelp;
    }
}

public class CommandBS : ICommand
{
    public string Is()
    {
        return "base";
    }

    public string Run(string[] args)
    {
        string strResult = "";
        if (args.Length == 2)
        {
            if (args[1] == "help")
                return Help();
        };


        if (!File.Exists(CommandBase.DATABASE))
        {
            return "Файл " + CommandBase.DATABASE + " не существует. Создайте командой init";
        }

        AMS.Profile.Ini Init = new AMS.Profile.Ini(CommandBase.INIT);
        string oracle = Init.GetValue("DATABASE", "oracle", "");

        string db = Init.GetValue("DATABASE", "db", "");

        AMS.Profile.Ini database = new AMS.Profile.Ini(CommandBase.DATABASE);
        string SID = database.GetValue(db, "SID", "");
        string USER = database.GetValue(db, "USERNAME", "");
        string PASSWORD = database.GetValue(db, "PASSWORD", "");

        if (oracle == "")
        {
            return "Укажите в файле " + CommandBase.DATABASE + " строку oracle=<path_to_sqlplus.exe>";
        }

        ProcessStartInfo ProcessInfo;
        Process Process;
        string strParam = USER + "/" + PASSWORD + "@" + SID + " @" + CommandBase.DIRMAIN + "\\base\\objects.txt";
        Console.WriteLine(strParam);
        ProcessInfo = new ProcessStartInfo(oracle+"\\sqlplus.exe", strParam);
        ProcessInfo.CreateNoWindow = false;
        ProcessInfo.UseShellExecute = false;
        //ProcessInfo.RedirectStandardOutput = true;
        Process = Process.Start(ProcessInfo);
        Process.WaitForExit();
        int ExitCode = Process.ExitCode;
        Process.Close();


        /*
         * nt ExitCode;
   ProcessStartInfo ProcessInfo;
   Process Process;

   ProcessInfo = new ProcessStartInfo("cmd.exe", "/C " + "wco -f C:\work\Lab.txt");
   ProcessInfo.CreateNoWindow = true;
   ProcessInfo.UseShellExecute = false;
   Process = Process.Start(ProcessInfo);
   Process.WaitForExit(Timeout);
   ExitCode = Process.ExitCode;
   Process.Close();

   return ExitCode;
         * */

        strResult += "\nВыполнено";
        return strResult;
    }

    public string Help()
    {
        string strHelp;
        strHelp = "Команда base - развернуть базовую версию";
        return strHelp;
    }
}



public class CommandCreate : ICommand
{
    public string Is()
    {
        return "create";
    }

    public string Run(string[] args)
    {
        string strResult = "";
        if (args.Length == 2)
        {
            if (args[1] == "help")
                return Help();
        };


        if (!File.Exists(CommandBase.DATABASE))
        {
            return "Файл " + CommandBase.DATABASE + " не существует. Создайте командой init";
        }

        AMS.Profile.Ini Init = new AMS.Profile.Ini(CommandBase.INIT);
        string sysdba_user = Init.GetValue("DATABASE", "sysdba_user", "");
        string sysdba_pass = Init.GetValue("DATABASE", "sysdba_pass", "");
        string sysdba_data = Init.GetValue("DATABASE", "sysdba_data", "");

        if (sysdba_user == "")
        {
            return "Укажите в файле " + CommandBase.DATABASE + " значения sysdba_user, sysdba_pass, sysdba_data";
        }

        if (args.Length<3)
        {
            return "Правильный формат create NAME PASS";
        }

        string strQuery = ""+
"create user "+args[1]+ " " +
"  identified by \""+args[2]+"\" "+
"  default tablespace USERS "+
"  temporary tablespace TEMP "+
"  profile DEFAULT "+
"  quota unlimited on smscenter; "+
" grant connect to "+args[1]+ "; "+
" grant dba to "+args[1]+ "; "+
" grant resource to " + args[1] + "; " +
" grant create any table to " + args[1] + "; " +
" grant create session to " + args[1] + "; " +
" grant insert any table to " + args[1] + "; " +
 " grant unlimited tablespace to " + args[1];
        try
        {
            DatabaseSQL.VersionUP(sysdba_data, sysdba_user, sysdba_pass, "", strQuery);
        }
        catch (Exception ex)
        {
            string err = ex.Message + "\n" + ex.StackTrace;
            return err;
        }

        AMS.Profile.Ini config = new AMS.Profile.Ini(CommandBase.DATABASE);
        config.SetValue(args[1].ToUpper(), "SID", sysdba_data);
        config.SetValue(args[1].ToUpper(), "USERNAME", args[1]);
        config.SetValue(args[1].ToUpper(), "PASSWORD", args[2]);

        AMS.Profile.Ini config1 = new AMS.Profile.Ini(CommandBase.INIT);
        config1.SetValue("DATABASE", "db", args[1].ToUpper());



        strResult += "\nВыполнено";
        return strResult;
    }

    public string Help()
    {
        string strHelp;
        strHelp = "Команда create - создать схему";
        return strHelp;
    }
}


public class CommandCompile : ICommand
{
    public string Is()
    {
        return "compile";
    }

    public string Run(string[] args)
    {
        string strResult = "";
        if (args.Length == 2)
        {
            if (args[1] == "help")
                return Help();
        };


        if (!File.Exists(CommandBase.DATABASE))
        {
            return "Файл " + CommandBase.DATABASE + " не существует. Создайте командой init";
        }

        AMS.Profile.Ini Init = new AMS.Profile.Ini(CommandBase.INIT);
        string oracle = Init.GetValue("DATABASE", "oracle", "");

        string db = Init.GetValue("DATABASE", "db", "");

        AMS.Profile.Ini database = new AMS.Profile.Ini(CommandBase.DATABASE);
        string SID = database.GetValue(db, "SID", "");
        string USER = database.GetValue(db, "USERNAME", "");
        string PASSWORD = database.GetValue(db, "PASSWORD", "");

        if (oracle == "")
        {
            return "Укажите в файле " + CommandBase.DATABASE + " строку oracle=<path_to_sqlplus.exe>";
        }

        ProcessStartInfo ProcessInfo;
        Process Process;
        string strParam = USER + "/" + PASSWORD + "@" + SID + " @" + CommandBase.DIRMAIN + "\\compile\\objects.txt";
        Console.WriteLine(strParam);
        ProcessInfo = new ProcessStartInfo(oracle + "\\sqlplus.exe", strParam);
        ProcessInfo.CreateNoWindow = false;
        ProcessInfo.UseShellExecute = false;
        //ProcessInfo.RedirectStandardOutput = true;
        Process = Process.Start(ProcessInfo);
        Process.WaitForExit();
        int ExitCode = Process.ExitCode;
        Process.Close();


        strResult += "\nВыполнено";
        return strResult;
    }

    public string Help()
    {
        string strHelp;
        strHelp = "Команда compile - компилирует пакеты";
        return strHelp;
    }
}

public class CommandInit : ICommand
{
    public string Is()
    {
        return "init";
    }

    public string Run(string[] args)
    {
        string strResult = "";
        if (args.Length == 2)
        {
            if (args[1] == "help")
                return Help();
        };


        if (File.Exists(CommandBase.DATABASE))
        {
            return "Файл " + CommandBase.DATABASE + " уже существует";
        }

        AMS.Profile.Ini config = new AMS.Profile.Ini(CommandBase.DATABASE);
        config.SetValue("PRODACTION", "SID", "SMSDVRTC");
        config.SetValue("PRODACTION", "USERNAME", "SMSCENTER");
        config.SetValue("PRODACTION", "PASSWORD", "zaq12wsx");

        config.SetValue("DEVELOPMENT", "SID", "SMSDVRTC");
        config.SetValue("DEVELOPMENT", "USERNAME", "SMSCENTER_DEBUG");
        config.SetValue("DEVELOPMENT", "PASSWORD", "zaq12wsx");
        
        config.SetValue("MIKHAIL", "SID", "SMSDVRTC");
        config.SetValue("MIKHAIL", "USERNAME", "SMSCENTER_DEBUG");
        config.SetValue("MIKHAIL", "PASSWORD", "zaq12wsx");

        strResult += "\nВыполнено";
        return strResult;
    }

    public string Help()
    {
        string strHelp;
        strHelp = "Команда init - инициализирует файл " + CommandBase.DATABASE;
        return strHelp;
    }
}

public class CommandDB : ICommand
{
    public string Is()
    {
        return "db";
    }

    public string Run(string[] args)
    {
        string strResult = "";
        if (args.Length == 2)
        {
            if (args[1] == "help")
                return Help();
        };


        if (args.Length == 2)
        {
            args[1] = args[1].ToUpper();
            AMS.Profile.Ini config = new AMS.Profile.Ini(CommandBase.DATABASE);
            if (!config.HasSection(args[1]) )
            {
                return "Секции " + args[1] + " в файле "+CommandBase.DATABASE+" не существует";
            }

            AMS.Profile.Ini config1 = new AMS.Profile.Ini(CommandBase.INIT);
            config1.SetValue("DATABASE", "db", args[1]);

        }
        else
        {
            return "Укажите наименование базы данных из файла database.ini";
        }

        
        strResult += "\nВыполнено";
        return strResult;
    }

    public string Help()
    {
        string strHelp;
        strHelp = "Команда db <name> - устанавливает текущую базу данных. name из файла " + CommandBase.DATABASE;
        return strHelp;
    }
}

namespace cr
{
    class Program
    {
        static ICommand[] theCommands = 
            {
                new CommandAdd(),
                new CommandMigrate(),
                new CommandInit(),
                new CommandDB(),
                new CommandBS(),
                new CommandCreate(),
                new CommandCompile()
            };

        static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                Console.WriteLine("null");
                return;
            }

            for (int i = 0; i < theCommands.Length; i++)
            {
                if (args[0] == theCommands[i].Is())
                {
                    string strResult = theCommands[i].Run(args);
                    Console.WriteLine(strResult);
                }
            }
         
            
        }
    }
}
