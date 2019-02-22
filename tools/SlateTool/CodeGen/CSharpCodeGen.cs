using System;
using System.Collections.Generic;

namespace TSheets.CodeGenTool.CodeGen
{
    internal class CSharpCodeGen : CodeGenerator
    {
        internal CSharpCodeGen(string endpoint)
            : base(endpoint)
        {
        }

        internal override string GenGetCode(List<KeyValuePair<string, string>> parameters)
        {
            string paramsString = ParamsToUrlString(parameters);

            return $"var client = new RestClient(\"{BaseUrl}/{this.Endpoint}{paramsString}\");" + NewLine()
                 + $"var request = new RestRequest(Method.GET);" + NewLine()
                 + $"request.AddHeader(\"Authorization\", \"Bearer <TOKEN>\");" + NewLine()
                 + $"IRestResponse response = client.Execute(request);";
        }

        internal override string GenPutCode()
        {
            return $"var client = new RestClient(\"{BaseUrl}/{this.Endpoint}\");" + NewLine()
                 + $"var request = new RestRequest(Method.PUT);" + NewLine()
                 + $"request.AddHeader(\"Content-Type\", \"application/json\");" + NewLine()
                 + $"request.AddHeader(\"Authorization\", \"Bearer <TOKEN>\");" + NewLine()
                 + $"request.AddParameter(\"undefined\", \"<REQUEST BODY>\", ParameterType.RequestBody);" + NewLine()
                 + $"IRestResponse response = client.Execute(request);";
        }

        internal override string GenDeleteCode(List<KeyValuePair<string, string>> parameters)
        {
            string paramsString = ParamsToUrlString(parameters);

            return $"var client = new RestClient(\"{BaseUrl}/{this.Endpoint}{paramsString}\");" + NewLine()
                 + $"var request = new RestRequest(Method.DELETE);" + NewLine()
                 + $"request.AddHeader(\"Authorization\", \"Bearer <TOKEN>\");" + NewLine()
                 + $"IRestResponse response = client.Execute(request);";
        }

        internal override string GenPostCode()
        {
            return $"var client = new RestClient(\"{BaseUrl}/{this.Endpoint}\");" + NewLine()
                 + $"var request = new RestRequest(Method.POST);" + NewLine()
                 + $"request.AddHeader(\"Content-Type\", \"application/json\");" + NewLine()
                 + $"request.AddHeader(\"Authorization\", \"Bearer <TOKEN>\");" + NewLine()
                 + $"request.AddParameter(\"undefined\", \"<REQUEST BODY>\", ParameterType.RequestBody);" + NewLine()
                 + $"IRestResponse response = client.Execute(request);";
        }
    }
}
