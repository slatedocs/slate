using System;
using System.Collections.Generic;

namespace TSheets.CodeGenTool.CodeGen
{
    internal class JavaCodeGen : CodeGenerator
    {
        internal JavaCodeGen(string endpoint)
            : base(endpoint)
        {
        }

        internal override string GenGetCode(List<KeyValuePair<string, string>> parameters)
        {
            string paramsString = ParamsToUrlString(parameters);

            return $"OkHttpClient client = new OkHttpClient();" + NewLine(2)

                 + $"Request request = new Request.Builder()" + NewLine()
                 + $"  .url(\"{BaseUrl}/{this.Endpoint}{paramsString}\")" + NewLine()
                 + $"  .get()" + NewLine()
                 + $"  .addHeader(\"Authorization\", \"Bearer <TOKEN>\")" + NewLine()
                 + $"  .build();" + NewLine(2)

                 + $"Response response = client.newCall(request).execute();";
        }

        internal override string GenPutCode()
        {
            return $"OkHttpClient client = new OkHttpClient();" + NewLine(2)

                 + $"MediaType mediaType = MediaType.parse(\"application/json\");" + NewLine()
                 + $"RequestBody body = RequestBody.create(mediaType, \"<REQUEST BODY>\");" + NewLine()
                 + $"Request request = new Request.Builder()" + NewLine()
                 + $"  .url(\"{BaseUrl}/{this.Endpoint}\")" + NewLine()
                 + $"  .put(body)" + NewLine()
                 + $"  .addHeader(\"Authorization\", \"Bearer <TOKEN>\")" + NewLine()
                 + $"  .addHeader(\"Content-Type\", \"application/json\")" + NewLine()
                 + $"  .build();" + NewLine(2)

                 + $"Response response = client.newCall(request).execute();";
        }

        internal override string GetDeleteCode()
        {
            throw new NotImplementedException();
        }

        internal override string GenPostCode()
        {
            return $"OkHttpClient client = new OkHttpClient();" + NewLine(2)

                 + $"MediaType mediaType = MediaType.parse(\"application/json\");" + NewLine()
                 + $"RequestBody body = RequestBody.create(mediaType, \"<REQUEST BODY>\");" + NewLine()
                 + $"Request request = new Request.Builder()" + NewLine()
                 + $"  .url(\"{BaseUrl}/{this.Endpoint}\")" + NewLine()
                 + $"  .post(body)" + NewLine()
                 + $"  .addHeader(\"Authorization\", \"Bearer <TOKEN>\")" + NewLine()
                 + $"  .addHeader(\"Content-Type\", \"application/json\")" + NewLine()
                 + $"  .build();" + NewLine(2)

                 + $"Response response = client.newCall(request).execute();";
        }
    }
}
