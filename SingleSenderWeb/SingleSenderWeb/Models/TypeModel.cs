using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.OracleClient;
using System.Data;
using System.Collections.Generic;

namespace SingleSenderWeb.Models
{
    public class TypeModel
    {
        public ulong ID { get; set; }
        public string Name { get; set; }
        public ulong Priority { get; set; }
    }

    public class TypeRepository
    {
        //IQueryable<TypeModel> Types { get; }
        public IQueryable<TypeModel> Types()
        {
            List<TypeModel> Type = new List<TypeModel>();

            OracleConnection Connection = new OracleConnection("Data Source=SMSRTKDV; User ID=smscenter; Password=zaq12wsx;");
            Connection.Open();
            OracleCommand cmd = new OracleCommand("select id, name, id as priority from type_task", Connection);
            OracleDataAdapter DataAdapter = new OracleDataAdapter();
            DataAdapter.SelectCommand = cmd;
           
            DataTable Table = new DataTable();           
            DataAdapter.Fill(Table);
            for(int i=0;i<Table.Rows.Count;i++)
            {
                TypeModel theTypeModel  = new TypeModel();
                theTypeModel.ID = Convert.ToUInt32(Table.Rows[i]["ID"].ToString());
                theTypeModel.Name = Table.Rows[i]["Name"].ToString();
                theTypeModel.Priority = Convert.ToUInt32(Table.Rows[i]["Priority"].ToString());
                Type.Insert(i, theTypeModel);
            }
            return Type.AsQueryable();
        }
        
        public List<SelectListItem> AsSelectList(int SelectedID)
        {
            return CreateSelectList(Types(), "Выберите тип", 0, SelectedID);
        }
        protected List<SelectListItem> CreateSelectList<T>(IEnumerable<T> data, string zeroField, int zeroValue, int selectedId)
    where T : TypeModel
        {
            return CreateSelectListInner(data, zeroField, zeroValue, selectedId).ToList();
        }

        //Создает данные для выпадающего списка в соответствии Id-Name
        //если задано zeroField, то оно добавляется первым со значением 0
        private IEnumerable<SelectListItem> CreateSelectListInner<T>(IEnumerable<T> data, string zeroField, int zeroValue, int selectedId)
                where T : TypeModel
        {
            if (zeroField != null)
            {
                yield return new SelectListItem { Value = zeroValue.ToString(), Text = zeroField, Selected = Equals(selectedId, zeroValue) };
            }

            foreach (var item in data)
            {
                yield return new SelectListItem { Value = item.ID.ToString(), Text = item.Name.ToString(), Selected = Equals(selectedId, item.ID) };
            }
        }
    }

    public class SelectTypeModel
    {
        public string ID { get; set; }
        public IEnumerable<SelectListItem> List { get; set; }
    }
}