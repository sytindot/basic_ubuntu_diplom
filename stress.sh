#!/bin/bash


apt install stress
stress --cpu 2 --io 4 --vm 4 --vm-bytes 1200M --timeout 3600s

