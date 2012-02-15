VERSION="1.9.3-p0"
curl https://raw.github.com/gist/1688857/2-$VERSION-patched.sh > /tmp/$VERSION-patch
ruby-build /tmp/$VERSION-patch $HOME/.rbfu/rubies/1.9-patch