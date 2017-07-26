using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KOBoxerList
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region Public Web Methods.
        /// <summary>
        /// Gets Boxer Details
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static Boxer[] FetchBoxers()
        {
            BoxingKOEntities dbEntities = new BoxingKOEntities();
            var data = (from item in dbEntities.Boxers
                        orderby item.BoxerId
                        select item).Take(5);
            return data.ToArray();
        }

        /// <summary>
        /// Saves Boxer Details
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [WebMethod]
        public static string SaveBoxer(Boxer[] data)
        {
            try
            {
                var dbContext = new BoxingKOEntities();
                var boxerList = from dbBoxer in dbContext.Boxers select dbBoxer;
                foreach (Boxer userDetails in data)
                {
                    var boxer = new Boxer();
                    if (userDetails != null)
                    {
                        boxer.BoxerId = userDetails.BoxerId;
                        boxer.FirstName = userDetails.FirstName;
                        boxer.NickName = userDetails.NickName;
                        boxer.LastName = userDetails.LastName;            
                        boxer.Age = userDetails.Age;
                        boxer.Gender = userDetails.Gender;
                        boxer.WeightClass = userDetails.WeightClass;
                        boxer.KOCount = userDetails.KOCount;
                        boxer.Record = userDetails.Record;
                        boxer.HomeTown = userDetails.HomeTown;
                        boxer.HomeState = userDetails.HomeState;
                    }
                    Boxer box = (from bx in boxerList
                                    where
bx.BoxerId == boxer.BoxerId
                                    select bx).FirstOrDefault();
                    if (box == null)
                        dbContext.Boxers.Add(boxer);
                    dbContext.SaveChanges();
                }
                return "Boxer(s) saved to database!";
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }

        /// <summary>
        /// Deletes Boxer Details
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [WebMethod]
        public static string DeleteBoxer(Boxer data)
        {
            try
            {
                var dbContext = new BoxingKOEntities();
                var boxer = dbContext.Boxers.FirstOrDefault
                (userId => userId.BoxerId == data.BoxerId);
                if (boxer != null)
                {
                    if (boxer != null)
                    {
                        dbContext.Boxers.Remove(boxer);
                        dbContext.SaveChanges();
                    }
                }
                return "Boxer deleted from database!";

            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }
        #endregion
    }
}