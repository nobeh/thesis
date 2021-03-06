# Actors at Work

This repository contains the source of my PhD thesis including
the publications during the period of research.

## Abstract

Object orientation provides principles for abstraction and encapsulation.
Abstraction is accomplished by high-level concepts of interfaces, classes, and objects.
Many object-oriented languages have followed the blocking and synchronous model of messaging. 
*Asynchronous* message passing is one of the fundamental elements of the actor model.
Unlike in object orientation, a message is not bound to any interface in the actor model.

Ongoing research focuses on combining object-oriented programming with the actor model and concurrency.
In a concurrent setting with objects, multi-threading is a common approach to provide an object-oriented concurrency model.
Integration of actor model and object orientation leads to the use of asynchronous method calls.
However, neither of object-orientation and actor model support explicit control of pre-emption for messages or asynchronous method calls.
In comparison to this rigid "run to completion"-execution style, coroutines are more flexible: they allow multiple entry points and can be used for collaborative pre-emption between tasks by giving up control with explicit yield or suspend instructions.
Coroutines are not originally established in the object-oriented paradigm.
Furthermore, interactions in both coroutines and multi-threading are blocking and synchronous.
The main challenge is to generate production code from an actor-based language which supports asynchronous method calls and coroutine-style execution.

This thesis contributes to the intersection of object orientation, the actor model, and concurrency.
We choose Java as the main target programming language and as one of the mainstream 
object-oriented languages. 
We formalize a subset of Java and its concurrency API.
We create an abstract mapping from an actor-based modeling language, ABS, to the programming semantics of concurrent Java. 
The mapping ensures a correct translation from a model to its equivalent production-ready code.
We provide the formal semantics of the mapping and runtime properties of 
the concurrency layer including deadlines and scheduling policies.
We provide an implementation of the ABS concurrency layer as a Java API library and framework using Java 8 features.
The implementation is generic and extensible as it can be used either as a standalone library or as part of a pluggable code generator.
We design and implement a runtime monitoring framework, JMSeq, to verify the
correct ordering of execution of methods in possibly interleaved threads through code annotations in JVM. 
In addition, we design a large-scale monitoring system as a real-world 
application; the monitoring system is built with ABS concurrent objects 
and formal semantics that leverages schedulability analysis to verify correctness of the monitors.

## LICENSE

Licensed with GPL v3 from original work of Behrooz Nobakht \<behrooz.nobakht@gmail.com\>



