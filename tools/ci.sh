#!/bin/bash

[[ -f "/tmp/kf5_dep_map" ]] && rm /tmp/kf5_dep_map

for formula in `ls kf5-*.rb`; do
  for dep in `grep "depends_on" $formula | awk -F "\"" '{print $2}'`; do
    echo "${dep/chigraph\/kf5\//} ${formula//\.rb/}" >> /tmp/kf5_dep_map
  done
done

tsort /tmp/kf5_dep_map > /tmp/kf5_install_order

for formula in `cat /tmp/kf5_install_order | grep -v kf5`; do
  brew install "$@" "${formula}"
done

for formula in `cat /tmp/kf5_install_order | grep kf5`; do
  brew install --build-bottle "$@" "${formula}"
  brew bottle "$@" "${formula}"
done
