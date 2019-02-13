using System;
using System.Collections.Generic;

namespace TSheets.CodeGenTool.CodeGen
{
    internal class CURLCodeGen : CodeGenerator
    {
        private const string AuthHeader = "Authorization: Bearer <TOKEN>";

        internal CURLCodeGen(string endpoint)
            : base(endpoint)
        {
        }

        internal override string GenGetCode(List<KeyValuePair<string, string>> parameters)
        {
            string paramsString = ParamsToUrlString(parameters);

            return $"curl \"{BaseUrl}/{this.Endpoint}{paramsString}\"" + NewLine()
                 + $"  -H \"{AuthHeader}\"";

        }

        internal override string GenPutCode()
        {
            return $"curl -X PUT \\" + NewLine()
                 + $"  {BaseUrl}/{this.Endpoint} \\" + NewLine()
                 + $"  -H 'Authorization: Bearer <TOKEN>' \\" + NewLine()
                 + $"  -H 'Content-Type: application/json' \\" + NewLine()
                 + $"  -d '<REQUEST BODY>'";
        }

        internal override string GetDeleteCode()
        {
            throw new NotImplementedException();
        }

        internal override string GenPostCode()
        {
            return $"curl -X POST \\" + NewLine()
                 + $"  {BaseUrl}/{this.Endpoint} \\" + NewLine()
                 + $"  -H 'Authorization: Bearer <TOKEN>' \\" + NewLine()
                 + $"  -H 'Content-Type: application/json' \\" + NewLine()
                 + $"  -d '<REQUEST BODY>'";
        }
    }
}
