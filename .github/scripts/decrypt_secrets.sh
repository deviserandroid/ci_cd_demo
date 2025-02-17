#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$APPLEID_PASSPHRASE" --output ./.github/secrets/CodknoxProvisioningProfile.mobileprovision ./.github/secrets/CodknoxProvisioningProfile.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$APPLEID_PASSPHRASE" --output ./.github/secrets/ios_distribution.cer ./.github/secrets/ios_distribution.cer.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/CodknoxProvisioningProfile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/CodknoxProvisioningProfile.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/ios_distribution.cer -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain