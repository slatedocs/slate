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
            var worker = new Worker();
            worker.DoIt();
            Console.ReadLine();
        }

    }

    internal class Worker
    {
        private List<string> langs = new List<string> { "shell", "csharp", "java", "javascript", "php", "ruby", "python", "go" };

        internal void Start()
        {
            string fileName = @"E:\puppet.png";

            string base64Encoded = null;

            byte[] rawBytes = File.ReadAllBytes(fileName);

            string encodedText = Convert.ToBase64String(rawBytes);

            File.WriteAllText("E:\\out.txt", encodedText);
        }

        internal void DoIt()
        {
            var parameters = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("linked_object_type", "timesheet"),
                new KeyValuePair<string, string>("object_ids", "730045")
            };

            DoItGet("files", parameters);

            Console.WriteLine("> The above command returns JSON with the following structure:\n");
            Console.WriteLine("```json");
            Console.WriteLine("TODO");
            Console.WriteLine("```\n");

        }

        private void DoItGet(string endpoint, List<KeyValuePair<string, string>> parameters)
        {
            Dictionary<string, CodeGenerator> codeGenerators = CodeGenFactory.Instance.GetCodeGenerators(endpoint);

            foreach (string lang in this.langs)
            {
                Console.WriteLine($"```{lang}");
                Console.WriteLine(codeGenerators[lang].GenGetCode(parameters));
                Console.WriteLine($"```\n");
            }
        }

        private void DoItPost(string endpoint)
        {
            Dictionary<string, CodeGenerator> codeGenerators = CodeGenFactory.Instance.GetCodeGenerators(endpoint);

            foreach (string lang in this.langs)
            {
                Console.WriteLine($"```{lang}");
                Console.WriteLine(codeGenerators[lang].GenPostCode());
                Console.WriteLine($"```\n");
            }
        }

        private void DoItPut(string endpoint)
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
    }
}
