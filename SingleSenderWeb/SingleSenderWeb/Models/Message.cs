using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;



namespace SingleSenderWeb.Models
{
    [Table(Name="Messages")] public class MessageModels
    {
        [Column] public string Message { get; set; }
        [Column] public string Phone { get; set; }
    }

    public class MessageRepository
    {
        private Table<MessageModels> messagesTable;
        public MessageRepository(string connectionString)
        {
            messagesTable = new DataContext(connectionString).GetTable<MessageModels>();
        }
        public void Add(MessageModels msg)
        {
        }
    }
}