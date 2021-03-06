#!/bin/bash
set -eu -o pipefail

outdir=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM
mkdir -p $outdir
mkdir -p $outdir/scripts
mkdir -p $outdir/scripts/bamkit
mkdir -p $PREFIX/bin

make
cp bin/lumpy $PREFIX/bin
cp scripts/lumpyexpress $PREFIX/bin

cp scripts/*.py $outdir/scripts
cp scripts/*.sh $outdir/scripts
cp scripts/*.pl $outdir/scripts
cp scripts/extractSplitReads* $outdir/scripts
cp scripts/vcf* $outdir/scripts
cp scripts/bamkit/* $outdir/scripts/bamkit

cp $RECIPE_DIR/lumpyexpress.config $outdir
ln -s $outdir/lumpyexpress.config $PREFIX/bin
