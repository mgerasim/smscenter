using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SMScenterMVC.Models
{
    public class DateTimeModelBinder : DefaultModelBinder
    {
        private Nullable<T> GetA<T>(ModelBindingContext bindingContext, string key) where T : struct
        {
            if (bindingContext.ValueProvider.ContainsPrefix(bindingContext.ModelName))
            {
                if (string.IsNullOrEmpty(key)) key = bindingContext.ModelName;
                else key = bindingContext.ModelName + "." + key;
            }
            if (string.IsNullOrEmpty(key)) return null;

            ValueProviderResult value;

            value = bindingContext.ValueProvider.GetValue(key);
            bindingContext.ModelState.SetModelValue(key, value);

            if (value == null)
            {
                return null;
            }

            Nullable<T> retVal = null;
            try
            {
                retVal = (Nullable<T>)value.ConvertTo(typeof(T));
            }
            catch (Exception) { }

            return retVal;
        }
        public override object BindModel(
            ControllerContext controllerContext,
            ModelBindingContext bindingContext)
        {
            if (bindingContext == null) throw new ArgumentNullException("bindingContext");

            // Check for a simple DateTime value with no suffix
            DateTime? dateTimeAttempt = GetA<DateTime>(bindingContext, "");
            if (dateTimeAttempt != null)
            {
                return dateTimeAttempt.Value;
            }

            // Check for separate Date / Time fields
            DateTime? dateAttempt = GetA<DateTime>(bindingContext, "Date");
            DateTime? timeAttempt = GetA<DateTime>(bindingContext, "TimeOfDay");

            /**/
            ValueProviderResult value;

            value = bindingContext.ValueProvider.GetValue("Started.TimeOfDay");
            bindingContext.ModelState.SetModelValue("Started.TimeOfDay", value);

            if (value == null)
            {
                return null;
            }

            var hours = ((string[])value.RawValue)[0];
            var minutes = ((string[])value.RawValue)[1];

            // A TimeSpan represents the time elapsed since midnight
            var time = new TimeSpan(Convert.ToInt32(hours),
                Convert.ToInt32(minutes), 0);

            /**/

            /*
            // Ensure there's incomming data
            var key = bindingContext.ModelName;
            var valueProviderResult = bindingContext.ValueProvider
                .GetValue(key);

            if (valueProviderResult == null ||
                string.IsNullOrEmpty(valueProviderResult
                    .AttemptedValue))
            {
                return null;
            }

            // Preserve it in case we need to redisplay the form
            bindingContext.ModelState
                .SetModelValue(key, valueProviderResult);

            // Parse
            var hours = ((string[])valueProviderResult.RawValue)[0];
            var minutes = ((string[])valueProviderResult.RawValue)[1];

            // A TimeSpan represents the time elapsed since midnight
            var time = new TimeSpan(Convert.ToInt32(hours),
                Convert.ToInt32(minutes), 0);
            /**/

            //If we got both parts, assemble them!
            if (dateAttempt != null )
            {
                return new DateTime(dateAttempt.Value.Year,
                    dateAttempt.Value.Month,
                    dateAttempt.Value.Day,
                    time.Hours,
                    time.Minutes,
                    time.Seconds
                    /*
                    timeAttempt.Value.Hour,
                    timeAttempt.Value.Minute,
                    timeAttempt.Value.Second
                     * */);
            }

            //Only got one half? Return as much as we have!
            return dateAttempt ?? timeAttempt;
        }
    }
}