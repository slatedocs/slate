using System;
using System.Collections.Generic;
using System.Linq;

namespace TSheets.CodeGenTool.CodeGen
{
    internal class PHPCodeGen : CodeGenerator
    {
        internal PHPCodeGen(string endpoint)
            : base(endpoint)
        {
        }

        internal override string GenGetCode(List<KeyValuePair<string, string>> parameters)
        {
            string paramString = null;
            if (parameters != null)
            {
                paramString = "$request->setQueryData(array(" + NewLine()
                    + string.Join("," + NewLine(), parameters.Select(kvp => $"  '{kvp.Key}' => '{kvp.Value}'").ToList()) + NewLine()
                    + "));" + NewLine(2);
            }

            string code1 = $"<?php" + NewLine(2)

                         + $"$request = new HttpRequest();" + NewLine()
                         + $"$request->setUrl('{BaseUrl}/{this.Endpoint}');" + NewLine()
                         + $"$request->setMethod(HTTP_METH_GET);" + NewLine(2);

            string code2 = $"$request->setHeaders(array(" + NewLine()
                         + $"  'Authorization' => 'Bearer <TOKEN>'" + NewLine()
                         + $"));" + NewLine(2)

                         + $"try {{" + NewLine()
                         + $"  $response = $request->send();" + NewLine(2)

                         + $"  echo $response->getBody();" + NewLine()
                         + $"}} catch (HttpException $ex) {{" + NewLine()
                         + $"  echo $ex;" + NewLine()
                         + $"}}";

            return code1 + paramString + code2;
        }

        internal override string GenPutCode()
        {
            return $"<?php" + NewLine(2)

                 + $"$request = new HttpRequest();" + NewLine()
                 + $"$request->setUrl('{BaseUrl}/{this.Endpoint}');" + NewLine()
                 + $"$request->setMethod(HTTP_METH_PUT);" + NewLine(2)

                 + $"$request->setHeaders(array(" + NewLine()
                 + $"  'Content-Type' => 'application/json'," + NewLine()
                 + $"  'Authorization' => 'Bearer <TOKEN>'" + NewLine()
                 + $"));" + NewLine(2)

                 + $"$request->setBody('<REQUEST BODY>');" + NewLine(2)

                 + $"try {{" + NewLine()
                 + $"  $response = $request->send();" + NewLine(2)

                 + $"  echo $response->getBody();" + NewLine()
                 + $"}} catch (HttpException $ex) {{" + NewLine()
                 + $"  echo $ex;" + NewLine()
                 + $"}}";
        }

        internal override string GetDeleteCode()
        {
            throw new NotImplementedException();
        }

        internal override string GenPostCode()
        {
            return $"<?php" + NewLine(2)

                 + $"$request = new HttpRequest();" + NewLine()
                 + $"$request->setUrl('{BaseUrl}/{this.Endpoint}');" + NewLine()
                 + $"$request->setMethod(HTTP_METH_POST);" + NewLine(2)

                 + $"$request->setHeaders(array(" + NewLine()
                 + $"  'Content-Type' => 'application/json'," + NewLine()
                 + $"  'Authorization' => 'Bearer <TOKEN>'" + NewLine()
                 + $"));" + NewLine(2)

                 + $"$request->setBody('<REQUEST BODY>');" + NewLine(2)

                 + $"try {{" + NewLine()
                 + $"  $response = $request->send();" + NewLine(2)

                 + $"  echo $response->getBody();" + NewLine()
                 + $"}} catch (HttpException $ex) {{" + NewLine()
                 + $"  echo $ex;" + NewLine()
                 + $"}}";
        }
    }
}
