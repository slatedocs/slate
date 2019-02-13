using System;
using System.Collections.Generic;

namespace TSheets.CodeGenTool.CodeGen
{
    internal class GoCodeGen : CodeGenerator
    {
        internal GoCodeGen(string endpoint)
            : base(endpoint)
        {
        }

        internal override string GenGetCode(List<KeyValuePair<string, string>> parameters)
        {
            string paramsString = ParamsToUrlString(parameters);

            return $"package main" + NewLine(2)

                 + $"import (" + NewLine()
                 + $"  \"fmt\"" + NewLine()
                 + $"  \"net/http\"" + NewLine()
                 + $"  \"io/ioutil\"" + NewLine()
                 + $")" + NewLine(2)

                 + $"func main() {{" + NewLine(2)

                 + $"  url := \"{BaseUrl}/{this.Endpoint}{paramsString}\"" + NewLine(2)

                 + $"  req, _ := http.NewRequest(\"GET\", url, nil)" + NewLine(2)

                 + $"  req.Header.Add(\"Authorization\", \"Bearer <TOKEN>\")" + NewLine(2)

                 + $"  res, _ := http.DefaultClient.Do(req)" + NewLine(2)

                 + $"  defer res.Body.Close()" + NewLine()
                 + $"  body, _ := ioutil.ReadAll(res.Body)" + NewLine(2)

                 + $"  fmt.Println(res)" + NewLine()
                 + $"  fmt.Println(string(body))" + NewLine(2)

                 + $"}}";
        }

        internal override string GenPutCode()
        {
            return $"package main" + NewLine(2)

                 + $"import (" + NewLine()
                 + $"  \"fmt\"" + NewLine()
                 + $"  \"strings\"" + NewLine()
                 + $"  \"net/http\"" + NewLine()
                 + $"  \"io/ioutil\"" + NewLine()
                 + $")" + NewLine(2)

                 + $"func main() {{" + NewLine(2)

                 + $"  url := \"{BaseUrl}/{this.Endpoint}\"" + NewLine(2)

                 + $"  payload := strings.NewReader(\"<REQUEST BODY>\")" + NewLine(2)

                 + $"  req, _ := http.NewRequest(\"PUT\", url, payload)" + NewLine(2)

                 + $"  req.Header.Add(\"Authorization\", \"Bearer <TOKEN>\")" + NewLine()
                 + $"  req.Header.Add(\"Content-Type\", \"application/json\")" + NewLine(2)

                 + $"  res, _ := http.DefaultClient.Do(req)" + NewLine(2)

                 + $"  defer res.Body.Close()" + NewLine()
                 + $"  body, _ := ioutil.ReadAll(res.Body)" + NewLine(2)

                 + $"  fmt.Println(res)" + NewLine()
                 + $"  fmt.Println(string(body))" + NewLine(2)

                 + $"}}";
        }

        internal override string GetDeleteCode()
        {
            throw new NotImplementedException();
        }

        internal override string GenPostCode()
        {
            return $"package main" + NewLine(2)

                 + $"import (" + NewLine()
                 + $"  \"fmt\"" + NewLine()
                 + $"  \"strings\"" + NewLine()
                 + $"  \"net/http\"" + NewLine()
                 + $"  \"io/ioutil\"" + NewLine()
                 + $")" + NewLine(2)

                 + $"func main() {{" + NewLine(2)

                 + $"  url := \"{BaseUrl}/{this.Endpoint}\"" + NewLine(2)

                 + $"  payload := strings.NewReader(\"<REQUEST BODY>\")" + NewLine(2)

                 + $"  req, _ := http.NewRequest(\"POST\", url, payload)" + NewLine(2)

                 + $"  req.Header.Add(\"Authorization\", \"Bearer <TOKEN>\")" + NewLine()
                 + $"  req.Header.Add(\"Content-Type\", \"application/json\")" + NewLine(2)

                 + $"  res, _ := http.DefaultClient.Do(req)" + NewLine(2)

                 + $"  defer res.Body.Close()" + NewLine()
                 + $"  body, _ := ioutil.ReadAll(res.Body)" + NewLine(2)

                 + $"  fmt.Println(res)" + NewLine()
                 + $"  fmt.Println(string(body))" + NewLine(2)

                 + $"}}";
        }
    }
}
