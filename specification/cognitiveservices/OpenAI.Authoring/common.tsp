import "@typespec/rest";
import "@typespec/http";

using TypeSpec.Rest;
using TypeSpec.Http;

namespace Azure.OpenAI;

// TODO: enum value types not supported in csharp emitter
enum TypeDiscriminatorKnownValues {
  List: "list",
  FineTune: "fine-tune",
  File: "file",
  FineTuneEvent: "fine-tune-event",
  Model: "model",
  Deployment: "deployment",
}

@knownValues(TypeDiscriminatorKnownValues)
scalar TypeDiscriminator extends string;

enum ScaleTypeKnownValues {
  Manual: "manual",
  Standard: "standard",
}

@knownValues(ScaleTypeKnownValues)
scalar ScaleType extends string;

enum ErrorCodeKnownValues {
  Conflict: "conflict",
  InvalidPayload: "invalidPayload",
  Forbidden: "forbidden",
  NotFound: "notFound",
  UnexpectedEntityState: "unexpectedEntityState",
  ItemDoesAlreadyExist: "itemDoesAlreadyExist",
  ServiceUnavailable: "serviceUnavailable",
  InternalFailure: "internalFailure",
  QuotaExceeded: "quotaExceeded",
}

@knownValues(ErrorCodeKnownValues)
scalar ErrorCode extends string;

enum InnerErrorCodeKnownValues {
  InvalidPayload: "invalidPayload",
}

@knownValues(InnerErrorCodeKnownValues)
scalar InnerErrorCode extends string;

enum PurposeKnownValues {
  FineTune: "fine-tune",
  FineTuneResults: "fine-tune-results",
}

@knownValues(PurposeKnownValues)
scalar Purpose extends string;

enum State {
  NotRunning: "notRunning",
  Running: "running",
  Succeeded: "succeeded",
  Canceled: "canceled",
  Failed: "failed",
  Deleted: "deleted",
}

enum LogLevel {
  Info: "info",
  Warning: "warning",
  Error: "error",
}

@doc("Created Response")
model CreatedResponse {
  @doc("The status code")
  @statusCode
  statusCode: 201;

  @doc("Location of the newly created item")
  @header
  @format("uri")
  location: string;
}
