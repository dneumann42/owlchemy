import std/macros

macro component(name, blk: untyped) =
  discard

macro page(def, blk: untyped) =
  discard

macro layout(def, blk: untyped) =
  discard

when isMainModule:
  type 
    IncrementButtonModel = object
      count = 0
    IncrementButtonMessageKind = enum
      Increment
      Decrement
    IncrementButtonMessage = object
      kind: IncrementButtonMessageKind
      amount: int

  component IncrementButton:
    proc init(): tuple[model: IncrementButtonModel, command: Option[Command]] =
      discard

    proc update(msg: IncrementButtonMessage, self: var IncrementButtonModel): Option[Command] =
      case msg.kind
      of Increment: self.count += msg.amount
      of Decrement: self.count -= msg.amount

    proc view(self: var IncrementButtonModel): Html =
      div:
        self.count
        button(
          onAction=emit(IncrementButtonModel(kind: Decrement, amount: 1))
        ):
          text = "-"
        button(
          onAction=emit(IncrementButtonModel(kind: Increment, amount: 1))
        ):
          text = "+"

  page Index("/"):
    discard

  page NewPost("/posts/new-post"):
    discard

  page NewPost("/posts/new-post"):
    discard

  layout("/"):
    div:
      h1: "Hello, World"
      `<slot>`

  echo("Hello, World!")
