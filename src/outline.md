# Introduction

- Why Nix?

  * Reproducible

  * Declarative

  * Reliable

  (Note: can borrow some content from the homepage.)

- Who Nix is for

- Who this book is for

  * This is a gentle introduction into Nix for new users. It is not a
    reference manual. It will refer to more in-depth resources where
    appropriate.

- Short overview of the Nix ecosystem:

  * Nix: package manager / build tool

  * Nixpkgs: package set

  * NixOS: Linux distribution built using Nix and Nixpkgs


# Installation

- If you're already on NixOS, you can skip this section.

- `curl http://nixos.org/nix/install`

- Mention static installer?

- Refer to Nix manual for other installation scenarios.

- Check that the install works: `nix run nixpkgs#nyancat`


# Running software with Nix

- Concepts introduced: flakes (very high-level), Nix store, building,
  substituting, binary cache

## Running `Hello World`

- `nix run nixpkgs#hello`

- Brief explanation what this does:

  * Fetches `nixpkgs`, a large set of instructions for building
    packages from source. `nixpkgs` is a *flake*. There are many other
    flakes.

  * *Evaluates* the build instructions for the Hello package and all
    its dependencies.

  * *Builds* or *substitutes* the Hello package and its dependencies.

## The Nix store

- ```console
  # nix shell nixpkgs#hello
  # type hello
  hello is /nix/store/9ywyxky6cv809jh143f8yxg5kc4bk2yq-hello-2.12/bin/hello
  ```

- Explain the Nix store

  * Store paths

  * Store path hashes

  * References

  * Closures: `nix path-info --recursive nixpkgs#hello`

- ...


# Imperative package management with Nix

- Imperative package management allows you to install and
  upgrade/downgrade packages in isolation from each other.

- When to use and when not to use imperative package management.

- `nix profile` examples


# Building software using Nix

## Creating your first flake

- `nix flake init`

- edit...

- `nix build`

## Development shells

- `nix develop`

- direnv?


# The Nix language

This should show/explain commonly-used language concepts (data types,
functions), ideally by building upon the flake example from the
previous chapter.

Not intended to replace the reference manual, so it shouldn't be
exhaustive description of the language or a formal semantics.

- `nix repl`

- Using the debugger.


# Customising Nix packages

(This gets into the currently undiscoverable parts of Nix, but we
can't avoid talking about it.)

- `.override` etc.

- Nixpkgs overlays

- Show how to override something from Nixpkgs from your flake.


# Programming language support

Show best current practice for setting up a project written in some
widely-used languages.

## Python

## Rust

## NodeJS

## ...


# Testing Nix packages

- `nix flake check`

- Check phase

- Testing packages using NixOS VMs; this can be a bridge into NixOS.

- CI integration; setting up your project on GitHub.


# Managing Nix systems

- Upgrading Nix

- Garbage collection

- Copying closures between machines

- Setting up remote builders?

- Setting up a binary cache? Might be more appropriate for the Nix
  reference manual, but we can point to it.



# Random chapters

- homemanager?

- Building (Docker) containers

  * Reducing closure sizes

- Intro to NixOS (a declaratively built NixOS VM could be the easiest
  way to get a running NixOS system)

- Declarative package management

- Deploying stuff

  * In the absense of a blessed `nix deploy` command, this should just
    give some pointers to various deployment tools and integration with
    Terraform, Kubernetes, etc.
