# chromote

Run chrome inside docker with novnc and remote debugging

## Usage

Build the image

```
docker build -t chromote .
```

Run the image in the background

```
docker run --name chromote --restart unless-stopped -v $(pwd)/data:/data -e VNCPASS=P4ssw0rd! -p 6080:6080 -p 127.0.0.1:9222:9222 chromote
```

Run the image and remove it after exit

```
docker run --rm -it -v $(pwd)/data:/data -e VNCPASS=P4ssw0rd! -p 8080:8080 -p 127.0.0.1:9222:9222 chromote
```

## Test

Test that remote debugging is working

```
go run main.go
```
