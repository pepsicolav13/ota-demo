# Continuous Integration

```yaml
# .github/
#      workflows/
#              main.yml
name: my first workflow              # workflow 이름
on: push                             # event trigger on push

jobs:
  build:                             # job id
    name: Hello world action         # job 이름
    runs-on: ubuntu-latest           # 가상 환경
    steps:
    - name: checkout source code     # step 01 이름
      uses: actions/checkout@master  # 소스코드 checkout
    - name: say hello                # step 02 이름
      run: echo "hello world"        # linux command 실행
```


```yaml
name: build spring boot application
on: push

jobs:
  build:
    name: build spring
    runs-on: ubuntu-latest
    steps:
    - name: checkout source code
      uses: actions/checkout@master
    - name: docker build 
      run: cd 02/demo && docker build . -t pepsicolav13/spring-boot
    - name: Login to Docker Hub
      uses: docker/login-action@v3
      with:
        username: ${{ secrets.USERNAME }}
        password: ${{ secrets.PASSWORD }}
    - name: docker push
      run: docker push pepsicolav13/spring-boot
```
