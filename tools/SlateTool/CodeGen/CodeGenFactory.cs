using System;
using System.Collections.Generic;

namespace TSheets.CodeGenTool.CodeGen
{
    internal class CodeGenFactory
    {
        private static readonly Lazy<CodeGenFactory> instance = new Lazy<CodeGenFactory>(() => new CodeGenFactory());
        public static CodeGenFactory Instance => instance.Value;

        internal Dictionary<string, CodeGenerator> GetCodeGenerators(string endpoint)
        {
            return new Dictionary<string, CodeGenerator>
            {
                { "shell", new CURLCodeGen(endpoint) },
                { "csharp", new CSharpCodeGen(endpoint) },
                { "java", new JavaCodeGen(endpoint) },
                { "javascript", new NodeCodeGen(endpoint) },
                { "php", new PHPCodeGen(endpoint) },
                { "ruby", new RubyCodeGen(endpoint) },
                { "python", new PythonCodeGen(endpoint) },
                { "go", new GoCodeGen(endpoint) },
            };
        }
    }
}
