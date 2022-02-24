#!/bin/sh

helm upgrade btcrpcexplorer -n bitcoin --create-namespace --install ./ -f values.yaml
