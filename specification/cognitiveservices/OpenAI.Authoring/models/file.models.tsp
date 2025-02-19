import "@typespec/rest";
import "@typespec/http";
import "@azure-tools/typespec-azure-core";

using TypeSpec.Rest;
using Azure.Core;

namespace Azure.OpenAI;

@doc("""
A file is a document usable for training and validation. It can also be a
service generated document with result details.
""")
@resource("files")
model File {
  @doc("Defines the type of an object.")
  @visibility("read")
  object?: TypeDiscriminator;

  @doc("The state of a job or item.")
  @visibility("read")
  status?: State;

  @doc("A timestamp when this job or item was created (in unix epochs).")
  @visibility("read")
  created_at?: int32;

  @doc("A timestamp when this job or item was modified last (in unix epochs).")
  @visibility("read")
  updated_at?: int32;

  @doc("The identity of this item.")
  @visibility("read")
  @key("fileId")
  id: string;

  @doc("""
The size of this file when available (can be null). File sizes larger than
2^53-1 are not supported to ensure compatibility
with JavaScript integers.
""")
  @visibility("read")
  bytes?: int32;

  @doc("""
The intended purpose of the uploaded documents. Use \"fine-tune\" for
fine-tuning. This allows us to validate the format of the uploaded file.
""")
  purpose: Purpose;

  @doc("The name of the file.")
  filename: string;
}

@doc("""
Defines a document to import from an external content url to be usable with
Azure OpenAI.
""")
model FileImport {
  @doc("""
The intended purpose of the uploaded documents. Use \"fine-tune\" for
fine-tuning. This allows us to validate the format of the uploaded file.
""")
  purpose: Purpose;

  @doc("""
The name of the [JSON Lines](https://jsonlines.readthedocs.io/en/latest/) file
to be uploaded.
If the `purpose` is set to \"fine-tune\", each line is a JSON
record with \"prompt\" and \"completion\" fields representing your training
examples.
""")
  filename: string;

  @doc("""
The url to download the document from (can be SAS url of a blob or any other
external url accessible with a GET request).
""")
  content_url: string;
}

@doc("content of uploaded file")
model FileContent {
  @doc("""
The intended purpose of the uploaded documents. Use \"fine-tune\" for
fine-tuning. This allows us to validate the format of the uploaded file.
""")
  purpose: Purpose;

  @doc("Gets or sets the file to upload into Azure OpenAI.")
  file: bytes;
}