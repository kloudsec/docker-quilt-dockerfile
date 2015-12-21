#!/bin/sh
cd /workspace/docker-quilt && git pull
cd /workspace/docker-quilt && pip install -r requirements.txt
PYTHONPATH=/workspace/docker-quilt python /workspace/docker-quilt/quilt/cli/manage.py reset True
PYTHONPATH=/workspace/docker-quilt python /workspace/docker-quilt/quilt/cli/manage.py deploy