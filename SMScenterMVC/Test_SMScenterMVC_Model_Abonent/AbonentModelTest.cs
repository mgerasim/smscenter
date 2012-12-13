using SMScenterMVC.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;

namespace Test_SMScenterMVC_Model_Abonent
{
    
    
    /// <summary>
    ///Это класс теста для AbonentModelTest, в котором должны
    ///находиться все модульные тесты AbonentModelTest
    ///</summary>
    [TestClass()]
    public class AbonentModelTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Получает или устанавливает контекст теста, в котором предоставляются
        ///сведения о текущем тестовом запуске и обеспечивается его функциональность.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Дополнительные атрибуты теста
        // 
        //При написании тестов можно использовать следующие дополнительные атрибуты:
        //
        //ClassInitialize используется для выполнения кода до запуска первого теста в классе
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //ClassCleanup используется для выполнения кода после завершения работы всех тестов в классе
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //TestInitialize используется для выполнения кода перед запуском каждого теста
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //TestCleanup используется для выполнения кода после завершения каждого теста
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///Тест для Update
        ///</summary>
        // TODO: убедитесь, что в атрибуте UrlToTest содержится URL-адрес страницы ASP.NET (например: 
        // http://.../Default.aspx). Это требуется для выполнения модульного теста на веб-сервере 
        // при тестировании страницы, веб-службы или службы WCF.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("D:\\mikhail\\Projects\\SMScenterMVC\\SMScenterMVC", "/")]
        [UrlToTest("http://localhost:54565/")]
        public void UpdateTest()
        {
            AbonentModel theAbonentNew = new AbonentModel();
            theAbonentNew.Name = "TEST";
            theAbonentNew.Phone = "TEST";
            theAbonentNew.Description = "TEST";
            

            AbonentModel target = new AbonentModel(); // TODO: инициализация подходящего значения
            target.Update();
            Assert.Inconclusive("Невозможно проверить метод, не возвращающий значение.");
        }
    }
}
