#!/bin/bash

function build() {
  cd "${GITHUB_WORKSPACE}" || exit
  cargo build --release --features portable

  mkdir "${GITHUB_WORKSPACE}/bin"
  cp "${GITHUB_WORKSPACE}/target/release/packetcrypt" "${GITHUB_WORKSPACE}/bin"

  cd "${GITHUB_WORKSPACE}" || exit
  bash -x ./contrib/macos/build.sh


  mv -v "${GITHUB_WORKSPACE}"'/packetcrypt-mac.pkg' \
    "${GITHUB_WORKSPACE}"'/'"${RELEASE_NAME}"'-mac.pkg'
}
build