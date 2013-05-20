# The KangaRuby Modeling Language

The `KangaRuby` modeling language is designed to make it simple to create "sequence diagrams". Sequence diagrams are used to model interactions between components of a system or protocol. The terms here are purposefully kept generic so as to allow for as many applications as possible. Even though sequence diagrams can be used to model a great many things, we will be using the generic term "system" for what is being modeled throughout this document.

## Elements of a Diagram

There are a couple of elements to a sequence diagram: `participants` and `actions`.

A participant is something or someone that is part of the system. A participant has a name and a lifetime. The name can be any text. The lifetime describes when the participant is available as a sender or receiver of actions. By default, the lifetime is the full lifetime of the system.

An action is a transmission of information from one component to another.
