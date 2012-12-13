/*
 * Дата         Задание     Ответственный       Комментарий
 * 2012-06-22   R0050       Герасимов           Создание файла
 * 2012-08-23   R0054       Герасимов           АРМ SMS: удаление информации и разделов
 * 2012-09-13   R0060       Книжник             АРМ SMS: разделение по филиалам
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using SMScenterMVC.Utils;
using System.Data;
using System.Data.OracleClient;

namespace SMScenterMVC.Models
{
    public class SmsinfosprModel
    {
        public Int32 ID { get; set; }
        [Display(Name = "Наименование:")]
        [Required(ErrorMessage = "* укажите наименование")]
        public string Name { get; set; }
        [Display(Name = "В разделе:")]
        public Int32 ParentID { get; set; }
        public Int32 BrancheID { get; set; }
        public SmsinfosprModel ParentSmsinfospr;

        public List<SmsinfosprModel> FindAll(string condition = "", string order = "")
        {
            SmsinfosprRepository _repo = new SmsinfosprRepository();
            return _repo.FindAll(condition, order);
        }

        public List<SmsinfosprModel> FindAllAsSelectList()
        {
            List<SmsinfosprModel> listResult = new List<SmsinfosprModel>();
            List<SmsinfosprModel> listParent = new List<SmsinfosprModel>();
            listResult = FindAll("PARENT_ID=0");
            listParent = FindAll("PARENT_ID=0");

            /*
            for (int i=0; i<listParent.Count; i++)
            {
                SmsinfosprModel item = listParent[i];
                
                listResult.AddRange(GetSubListByParent(item.ID, 0));
            }
            */
            listResult = GetSubListByParent(0, 1);
            return listResult;
        }

        protected List<SmsinfosprModel> GetSubListByParent(Int32 ParentID, Int32 NumSub)
        {
            List<SmsinfosprModel> listResult = new List<SmsinfosprModel>();
            List<SmsinfosprModel> listParent = new List<SmsinfosprModel>();

            if (NumSub > 10)
            {
                return listResult;
            }

            listResult = FindAll("PARENT_ID = " + ParentID.ToString());

            for(int i=0; i<listResult.Count; i++)
            {
                string strNum = "";
                for(int ii=0; ii<NumSub; ii++)
                {
                    strNum += ".";
                }
                listResult[i].Name = strNum + listResult[i].Name ;
                
                listParent = GetSubListByParent(listResult[i].ID, NumSub + 1);

                listResult.InsertRange(i + 1, listParent);
                i += listParent.Count;
                
            }
            return listResult;
        }


        public SmsinfosprModel FindOne(int ID)
        {
            SmsinfosprRepository _repo = new SmsinfosprRepository();
            SmsinfosprModel theSpr = _repo.FindAll("ID="+ID.ToString())[0];

            this.ID = theSpr.ID;
            this.Name = theSpr.Name;
            this.ParentID = theSpr.ParentID;

            return this;
        }

        public void Create()
        {
            SmsinfosprRepository _repo = new SmsinfosprRepository();
            _repo.Create(this);
        }

        public void Update()
        {
            SmsinfosprRepository _repo = new SmsinfosprRepository();
            _repo.Update(this);
        }

        public void Delete()
        {
            SmsinfosprRepository _repo = new SmsinfosprRepository();

            List<SmsinfosprModel> listResult = new List<SmsinfosprModel>();
            listResult = FindAll("PARENT_ID="+this.ID);

            if (listResult.Count > 0)
            {
                for (int i = 0; i < listResult.Count; i++)
                {
                    SmsinfosprModel item = listResult[i];
                    item.Delete();
                }
            }
           
            _repo.Delete(this);
            
        }
    }

    public class SmsinfosprRepository
    {
        public List<SmsinfosprModel> FindAll(string condition = "", string order = "")
        {
            List<SmsinfosprModel> SprList = new List<SmsinfosprModel>();
            DBConnection conn = null;
            try
            {
                conn = new DBConnection();                
                conn.Open();
                
                UserModel theUser = new UserModel();
                theUser.FindByID(UserModel.CurrentUserId);
                
                string strSQL = "SELECT * FROM SMSINFOSPR where BRANCHE_ID = " + theUser.BrancheID; 

                if (condition.Length > 0)
                {
                    strSQL = strSQL + " and " + condition;
                }
                if (order.Length > 0)
                {
                    strSQL = strSQL + " order by " + order;
                }

                DataTable Table = new DataTable();

                conn.ExecQuerySelect(strSQL, ref Table);

                for (int i = 0; i < Table.Rows.Count; i++)
                {
                    SmsinfosprModel theSmsinfosprModel = new SmsinfosprModel();
                    theSmsinfosprModel.ID = Convert.ToInt32(Table.Rows[i]["ID"].ToString());
                    theSmsinfosprModel.Name = Table.Rows[i]["Name"].ToString();
                    theSmsinfosprModel.ParentID = Convert.ToInt32(Table.Rows[i]["PARENT_ID"].ToString());
                    
                    SprList.Insert(i, theSmsinfosprModel);
                }
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
            finally
            {
                conn.Connection.Dispose();
                conn.Connection.Close();
            }
            return SprList;
        }




        public void Create(SmsinfosprModel theSpr)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                
                UserModel theUser = new UserModel();
                theUser.FindByID(UserModel.CurrentUserId);

                string strSQL = string.Format("INSERT INTO SMSINFOSPR(ID, NAME,  PARENT_ID, BRANCHE_ID) VALUES(s_smsinfospr.nextval, '{0}', '{1}','{2}')",
                    theSpr.Name,
                    theSpr.ParentID,
                    theUser.BrancheID);

                Connection.ExecQueryInsert(strSQL);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                Connection.Close();
            }
        }

        public void Update(SmsinfosprModel theSpr)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                string strSQL = string.Format("UPDATE SMSINFOSPR SET NAME='{0}', PARENT_ID='{1}' WHERE ID = {2}",
                    theSpr.Name,
                    theSpr.ParentID,
                    theSpr.ID);

                Connection.ExecQueryInsert(strSQL);                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                Connection.Close();
            }
        }
        
        public void Delete(SmsinfosprModel theSpr)
        {
            DBConnection Connection = new DBConnection();
            try
            {
                Connection.Open();
                string strSQL = string.Format("DELETE FROM SMSINFOSPR WHERE ID = {0}",
                    theSpr.ID);

                Connection.ExecQueryInsert(strSQL);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                Connection.Close();
            }
        }

    }
}