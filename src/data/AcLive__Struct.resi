open RescriptStruct

open AcLive__Message

let serializeRequest: requestData => Result.t<string, S.error>

let parseResponse: string => Result.t<responseData, S.error>
