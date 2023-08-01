open RescriptStruct

open AcLive__Message

let serializeRequest: requestData => Result.t<string, S.Error.t>

let parseResponse: string => Result.t<responseData, S.Error.t>
