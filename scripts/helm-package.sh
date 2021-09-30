#!/bin/sh
. ../release.config
[[ ! -z "$REGISTRY" ]] && REGISTRY="$REGISTRY/"

TMPDIR=/tmp/helm-package/$PROJECT_NAME
mkdir -p $TMPDIR
cp -r ../chart/* $TMPDIR

sed -i "s/PROJECT_NAME/$PROJECT_NAME/g" $TMPDIR/values.yaml
sed -i "s/REPO/$REPO/g" $TMPDIR/values.yaml
sed -i "s/PROJECT_HOST/$PROJECT_HOST/g" $TMPDIR/values.yaml
sed -i "s?REGISTRY?$REGISTRY?g" $TMPDIR/values.yaml

sed -i "s/PROJECT_NAME/$PROJECT_NAME/g" $TMPDIR/Chart.yaml
sed -i "s/RELEASE_VERSION/$RELEASE_VERSION/g" $TMPDIR/Chart.yaml

helm package $TMPDIR -d ../

rm -rf /tmp/helm-package
