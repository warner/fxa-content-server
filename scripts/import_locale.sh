#!/bin/sh -e

# syntax:
# import_locale.sh

git clone https://github.com/mozilla/fxa-content-server-l10n

if diff locale/templates/LC_MESSAGES/client.pot fxa-content-server-l10n/locale/templates/LC_MESSAGES/client.pot; then
    echo "client.pot file differs! aborting!"
    exit 1
fi
if diff locale/templates/LC_MESSAGES/server.pot fxa-content-server-l10n/locale/templates/LC_MESSAGES/server.pot; then
    echo "server.pot file differs! aborting!"
    exit 1
fi

# if the .pot files are the same, then it should be safe to pull the .po
# files

rm -r locale
cp -r fxa-content-server-l10n/locale locale

rm -rf fxa-content-server-l10n

echo
echo "locale/ updated: please review, commit, and push"
echo " (only .po files should have changed)"
