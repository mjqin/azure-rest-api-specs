import "@azure-tools/typespec-azure-core";
import "./common.tsp";

namespace Azure.OpenAI.ServiceCustomizations;

@friendlyName("{name}List", T)
model OpenAiList<T extends object, TType extends Azure.OpenAI.TypeDiscriminator> {
    @doc("Defines the type of this object")
    object?: TType;
    @doc("The list of {name}s", T)
    data?: T[];
}

// TODO: enum value types not supported in csharp emitter, change TypeDiscriminator to TypeDiscriminatorKnownValues enum when fixed
#suppress "@azure-tools/typespec-azure-core/documentation-required" "Internal template - no need for public documentation"
op OpenAIListOperation<T extends object, TType extends Azure.OpenAI.TypeDiscriminator> is Azure.Core.Foundations.ResourceList<T, {}, OpenAiList<T, TType>>;
