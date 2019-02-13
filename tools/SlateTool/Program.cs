using System;
using System.Collections.Generic;
using System.IO;
using TSheets.CodeGenTool.CodeGen;


namespace TSheets.CodeGenTool
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                string mode = args[0].ToLowerInvariant();

                if (mode == "codegen")
                {
                    if (args.Length < 3)
                    {
                        Usage();
                    }

                    string endpoint = args[1].ToLowerInvariant();
                    string method = args[2].ToLowerInvariant();
                    if (!new List<string> { "get", "post", "put", "delete" }.Contains(method))
                    {
                        Usage();
                    }

                    var kvps = new List<string>();
                    if (args.Length > 3)
                    {

                        for (int i = 3; i < args.Length; i++)
                        {
                            kvps.Add(args[i]);
                        }
                    }

                    var worker = new CodeGenWorker();
                    worker.DoCodeGen(endpoint, method, kvps);
                }
                else if (mode == "tablegen")
                {
                    if (args.Length != 3)
                    {
                        Usage();
                    }

                    string fileName = args[2];
                    string tableType = args[1].ToLowerInvariant();

                    var worker = new TableGenWorker();
                    if (tableType == "object")
                    {
                        worker.DoObjectTableGen(fileName);
                    }
                    else if (tableType == "params")
                    {
                        worker.DoParamsTableGen(fileName);
                    }
                    else
                    {
                        Usage();
                    }

                }
                else
                {
                    Usage();
                }
            }
            catch (Exception e)
            {
                Console.Write(e.Message + "\n");
            }
        }

        private static void Usage()
        {
            Console.WriteLine("CodeGen.exe codegen <endpoint> <method> [kvp1 kvp2 etc.]");
            Console.WriteLine("-OR-");
            Console.WriteLine("CodeGen.exe tablegen object|params <filename>\n");

            Console.WriteLine("Examples:");
            Console.WriteLine("CodeGen.exe codegen files get linked_object_type=timesheet object_ids=1757985");
            Console.WriteLine("CodeGen.exe tablegen object|params tabledef.txt\n");
        }

    }

    internal class TableGenWorker
    {
        internal void DoObjectTableGen(string file)
        {
            var outLines = new List<string>();
            string[] lines = File.ReadAllLines(file);

            outLines.Add("|                |             |             |");
            outLines.Add("| -------------: | :---------: | ----------- |");

            int lineNum = 0;
            foreach (string line in lines)
            {
                lineNum++;

                string[] fields = line.Split(';');
                if (fields.Length != 4)
                {
                    throw new Exception($"Invalid field count on line {lineNum}.");
                }

                outLines.Add($"| **{fields[0]}**<br/>{fields[1]} | _{fields[2]}_ | {fields[3]} |");
            }

            foreach (string line in outLines)
            {
                Console.WriteLine(line);
            }
        }

        internal void DoParamsTableGen(string file)
        {
            var outLines = new List<string>();
            string[] lines = File.ReadAllLines(file);

            outLines.Add("|                |             |");
            outLines.Add("| -------------: | ----------- |");

            int lineNum = 0;
            foreach (string line in lines)
            {
                lineNum++;

                string[] fields = line.Split(';');
                if (fields.Length != 3)
                {
                    throw new Exception($"Invalid field count on line {lineNum}.");
                }

                outLines.Add($"| **{fields[0]}**<br/>{fields[1]} | _{fields[2]}_ |");
            }

            foreach (string line in outLines)
            {
                Console.WriteLine(line);
            }
        }


    }

    internal class CodeGenWorker
    {
        private List<string> langs = new List<string> { "shell", "csharp", "java", "javascript", "php", "ruby", "python", "go" };

        internal void DoCodeGen(string endpoint, string method, List<string> kvps)
        {
            List<KeyValuePair<string, string>> parameters = null;

            if (kvps.Count > 0)
            {
                parameters = new List<KeyValuePair<string, string>>();

                foreach (string kvp in kvps)
                {
                    string[] fields = kvp.Split('=');
                    parameters.Add(new KeyValuePair<string, string>(fields[0], fields[1]));
                }
            }

            switch (method)
            {
                case "get":
                    DoCodeGenGet(endpoint, parameters);
                    break;

                case "post":
                    DoCodeGenPost(endpoint);
                    break;

                case "put":
                    DoCodeGenPut(endpoint);
                    break;

                case "delete":
                    DoCodeGenDelete(endpoint);
                    break;
            }
           
            Console.WriteLine("> The above command returns JSON with the following structure:\n");
            Console.WriteLine("```json");
            Console.WriteLine("TODO");
            Console.WriteLine("```\n");
        }

        private void DoCodeGenGet(string endpoint, List<KeyValuePair<string, string>> parameters)
        {
            Dictionary<string, CodeGenerator> codeGenerators = CodeGenFactory.Instance.GetCodeGenerators(endpoint);

            foreach (string lang in this.langs)
            {
                Console.WriteLine($"```{lang}");
                Console.WriteLine(codeGenerators[lang].GenGetCode(parameters));
                Console.WriteLine($"```\n");
            }
        }

        private void DoCodeGenPost(string endpoint)
        {
            Dictionary<string, CodeGenerator> codeGenerators = CodeGenFactory.Instance.GetCodeGenerators(endpoint);

            foreach (string lang in this.langs)
            {
                Console.WriteLine($"```{lang}");
                Console.WriteLine(codeGenerators[lang].GenPostCode());
                Console.WriteLine($"```\n");
            }
        }

        private void DoCodeGenDelete(string endpoint)
        {
            throw new NotImplementedException();
        }

        private void DoCodeGenPut(string endpoint)
        {
            Dictionary<string, CodeGenerator> codeGenerators = CodeGenFactory.Instance.GetCodeGenerators(endpoint);

            foreach (string lang in this.langs)
            {
                Console.WriteLine($"```{lang}");
                Console.WriteLine(codeGenerators[lang].GenPutCode());
                Console.WriteLine($"```\n");
            }
        }

        public static string ConvertToBase64(Stream stream)
        {
            byte[] bytes;
            using (var memoryStream = new MemoryStream())
            {
                stream.CopyTo(memoryStream);
                bytes = memoryStream.ToArray();
            }

            return Convert.ToBase64String(bytes);
        }

        //internal void Start()
        //{
        //    string fileName = @"E:\puppet.png";

        //    string base64Encoded = null;

        //    byte[] rawBytes = File.ReadAllBytes(fileName);

        //    string encodedText = Convert.ToBase64String(rawBytes);

        //    File.WriteAllText("E:\\out.txt", encodedText);
        //}
    }

    internal enum OperationMode
    {
        CodeGen,
        TableGen
    }
}
