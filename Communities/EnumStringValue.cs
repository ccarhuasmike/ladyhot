using System;

namespace Communities
{
    public class EnumStringAttribute : Attribute
    {
        public string Value { get; private set; }

        public EnumStringAttribute(string value)
        {
            Value = value;
        }
    }
}
