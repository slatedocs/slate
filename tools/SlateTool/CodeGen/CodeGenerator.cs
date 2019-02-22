using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TSheets.CodeGenTool.CodeGen
{
    internal abstract class CodeGenerator
    {
        protected const string BaseUrl = "https://rest.tsheets.com/api/v1";

        protected string Endpoint { get; }

        internal CodeGenerator(string endpoint)
        {
            this.Endpoint = endpoint;
        }

        internal abstract string GenGetCode(List<KeyValuePair<string, string>> parameters);

        internal abstract string GenPostCode();

        internal abstract string GenPutCode();

        internal abstract string GenDeleteCode(List<KeyValuePair<string, string>> parameters);

        protected static string NewLine(int count = 1)
        {
            string nl = null;
            for (int i = 0; i < count; i++)
            {
                nl += Environment.NewLine;
            }

            return nl;
        }

        protected static string ParamsToUrlString(List<KeyValuePair<string, string>> parameters)
        {
            string paramsString = null;

            if (parameters != null)
            {
                paramsString = "?";
                paramsString += string.Join("&", parameters.Select(kvp => $"{kvp.Key}={UrlEncodeIt(kvp.Value)}").ToList());
            }

            return paramsString;
        }

        public static string UrlEncodeIt(string s)
        {
            char[] temp = HttpUtility.UrlEncode(s).ToCharArray();
            for (int i = 0; i < temp.Length - 2; i++)
            {
                if (temp[i] == '%')
                {
                    temp[i + 1] = char.ToUpper(temp[i + 1]);
                    temp[i + 2] = char.ToUpper(temp[i + 2]);
                }
            }

            s = new string(temp);
            s = s.Replace("*", "%2A");

            return s;
        }
    }
}
