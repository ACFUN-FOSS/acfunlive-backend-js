type eventType =
  | @as("open") Open | @as("close") Close | @as("message") Message | @as("error") Error_

type event<'a> = {@as("type") type_: eventType, target: 'a}

type closeEvent<'a> = {...event<'a>, code?: int, reason?: string, wasClean?: bool}

type messageEvent<'a> = {...event<'a>, data: string}

type errorEvent<'a> = {...event<'a>, error?: Error.t, message?: string}

module type WebSocket = {
  type t

  let make: string => t

  let isOpen: t => bool

  let send: (t, string) => unit

  let close: t => unit

  let addOpenListener: (t, event<t> => unit) => unit

  let removeOpenListener: (t, event<t> => unit) => unit

  let addCloseListener: (t, closeEvent<t> => unit) => unit

  let removeCloseListener: (t, closeEvent<t> => unit) => unit

  let addMessageListener: (t, messageEvent<t> => unit) => unit

  let removeMessageListener: (t, messageEvent<t> => unit) => unit

  let addErrorListener: (t, errorEvent<t> => unit) => unit

  let removeErrorListener: (t, errorEvent<t> => unit) => unit
}
