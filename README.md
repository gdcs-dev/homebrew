# homebrew

Homebrew tap for RDK / xMiDT components built by
[package-workflows](https://github.com/stepherg/package-workflows).

Bottles are published as GitHub Releases in this repository, one release per
package, tagged `<package>-v<version>`. Bottles are provided for macOS on both
Apple Silicon (`arm64`) and Intel (`x86_64`).

## Requirements

- macOS with [Homebrew](https://brew.sh) installed
- Access to this repository (the releases must be reachable by `brew`)

## Adding the tap

This repository is not named `homebrew-*`, so the clone URL must be passed
explicitly:

```bash
brew tap gdcs-dev/homebrew https://github.com/gdcs-dev/homebrew
```

Verify the tap and see what it provides:

```bash
brew tap-info gdcs-dev/homebrew
brew search gdcs-dev/homebrew/
```

## Installing packages

```bash
# Fully qualified name (always unambiguous)
brew install gdcs-dev/homebrew/rbus

# Short name, once the tap is added and the name doesn't collide with homebrew-core
brew install rbus
```

Use the fully qualified name whenever a formula name also exists in
`homebrew-core`, otherwise Homebrew installs the core version:

```bash
brew install gdcs-dev/homebrew/ucode-quickjs
```

Dependencies between tap packages are resolved automatically — installing
`rbus-elements`, for example, pulls in `rbus`.

## Packages that run as services

Several formulae define a launchd service:

```bash
brew services start rbus
brew services start rbus-elements

brew services list
brew services stop rbus-elements
```

## Upgrading

```bash
brew update
brew upgrade gdcs-dev/homebrew/rbus
```

## Removing

```bash
brew uninstall gdcs-dev/homebrew/rbus
brew untap gdcs-dev/homebrew
```

## Available formulae

| Formula | Description |
| --- | --- |
| `blizzard-cpp-sdk` | Blizzard C++ SDK library |
| `blizzard-http` | HTTP provider for the Blizzard framework |
| `blizzard-rdk` | Blizzard framework implementation for RDK devices |
| `blizzard-time` | Time provider for the Blizzard framework |
| `blizzard-tinyshell` | TinyShell implementation for the Blizzard framework |
| `collectd-rbus-plugin` | Collectd plugin for RBus data-model values |
| `component-registry` | RDK Component Registry (CR) |
| `libccsp-common` | CCSP common library |
| `libcimplog` | Simple logging library for RDK Logger |
| `libcjwt` | C JWT implementation |
| `libcpeabs` | CPE abstraction layer |
| `liblinenoise` | Minimal readline replacement |
| `libnanomsg` | Scalability protocols implementation |
| `libnopoll` | WebSocket (RFC 6455) implementation in ANSI C |
| `librdk-logger` | General-purpose logging for RDK components |
| `libsafec` | Safe C Library — secure string and memory functions |
| `libsyswrapper` | Secure wrapper for system calls |
| `libtrower-base64` | Base64 encode/decode in C |
| `libubox` | OpenWrt utility library |
| `libwdmp-c` | WebPA data model parser |
| `libwebconfig-framework` | WebConfig framework for RDK components |
| `libwrp-c` | WRP (WebPA Request Protocol) library in C |
| `parodus` | xMiDT client coordinator |
| `rbus` | RDK Bus messaging system |
| `rbus-elements` | RBus elements provider |
| `telemetry` | RDK Telemetry 2.0 framework |
| `ubus` | OpenWrt RPC daemon and CLI |
| `uci` | OpenWrt Unified Configuration Interface |
| `ucode-quickjs` | QuickJS engine build used by ucode |
| `utopia` | RDK-B Utopia service framework |
| `webcfg` | WebConfig client implementation |
| `xmidt-agent-rs` | xMiDT agent implementation in Rust |
| `xmidt-rbus` | xMiDT RBus integration library |

## Troubleshooting

**`brew tap` fails with "Invalid tap name"** — include the URL argument shown
above; the repository name does not follow the `homebrew-<name>` convention.

**404 downloading a bottle** — the formula's version and the published release
tag are out of sync. Run `brew update` first; if it persists, the bottle for
that version has not been uploaded yet.

**Building from source instead of using a bottle** — a bottle exists only for
the macOS versions it was built on. Add `--build-from-source` explicitly if you
want a source build, or file an issue to request a bottle for your platform.