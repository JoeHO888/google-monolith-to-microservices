#!/bin/bash

# Copyright 2019 Google LLC
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     https://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

printf "Doing for orders microservice...\n"

printf "Building Image...\n"
cd ./microservices/src/orders
docker build -t orders:1.0.0 .

printf "Deploying monolith...\n"
k3d image import orders:1.0.0
kubectl apply -f deployment.yaml