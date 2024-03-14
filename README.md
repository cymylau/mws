A very crappy, but small web server. This doesn't support TLS / SSL, so only HTTP not HTTPS. It's ideal for small (tiny) projects. 
Currently; its less than 5MB in size plus your static content. 

# Why?
There's a lot of great ways to host static content for free - github pages I think doesn't get enough reconition, not to mention the endless cloud storage solutions that allow for static http hosting. Sometimes, you have an itch to learn, to try something yourself. This is why I created this. If it helps someone else then great. I wouldn't recommend anyone uses this for anything important, but its a nice reference / learning curve. 

# Building Locally.

Before doing anything, quickly check this repo. There should only be a few files and they're easy to read. Make sure you know what this is doing. 

Clone this repo (if feeling brave). 
```
git clone https://github.com/cymylau/mws
```
Change into the MWS directory
```
cd mws
```
Your content needs to be placed into the WWW folder (mws/www) within the mws folder, there's a (rather spiffing) hello world index.html. 

Edit this, delete it or replace it with content such as content produced by Jekyll. 

When your content is ready, build the image, provide a new image name (replace mystaticweb) and tag (:test) with appropriate values for your use. 

```
docker build -t mystaticweb:test .
[+] Building 2.4s (9/9) FINISHED                                                                                                                           docker:desktop-linux
 => [internal] load .dockerignore                                                                                                                                          0.0s
 => => transferring context: 2B                                                                                                                                            0.0s
 => [internal] load build definition from dockerfile                                                                                                                       0.0s
 => => transferring dockerfile: 399B                                                                                                                                       0.0s
 => [internal] load metadata for docker.io/library/busybox:latest                                                                                                          1.9s
 => [1/4] FROM docker.io/library/busybox:latest@sha256:650fd573e056b679a5110a70aabeb01e26b76e545ec4b9c70a9523f2dfaf18c6                                                    0.4s
 => => resolve docker.io/library/busybox:latest@sha256:650fd573e056b679a5110a70aabeb01e26b76e545ec4b9c70a9523f2dfaf18c6                                                    0.0s
 => => sha256:15b3852228f2a4251fb997ce32a52204b76babcaae22df16cac5e217d95a5c07 610B / 610B                                                                                 0.0s
 => => sha256:46bd05c4a04f3d121198e054da02daed22d0f561764acb0f0594066d5972619b 390B / 390B                                                                                 0.0s
 => => sha256:45d8eb5967de4c266a4cee23081b4e3855f4f8690f8b9165f804d19278bdeb5e 1.84MB / 1.84MB                                                                             0.3s
 => => sha256:650fd573e056b679a5110a70aabeb01e26b76e545ec4b9c70a9523f2dfaf18c6 6.76kB / 6.76kB                                                                             0.0s
 => => extracting sha256:45d8eb5967de4c266a4cee23081b4e3855f4f8690f8b9165f804d19278bdeb5e                                                                                  0.1s
 => [internal] load build context                                                                                                                                          0.0s
 => => transferring context: 82B                                                                                                                                           0.0s
 => [2/4] RUN adduser -D static                                                                                                                                            0.1s
 => [3/4] WORKDIR /home/static                                                                                                                                             0.0s
 => [4/4] COPY ./www .                                                                                                                                                     0.0s
 => exporting to image                                                                                                                                                     0.0s
 => => exporting layers                                                                                                                                                    0.0s
 => => writing image sha256:91e37b6f661b0a59e1de2eaec542f630201f202a9bf80ecf576e4622b5aa6a38                                                                               0.0s
 => => naming to docker.io/library/mystaticweb:test
```

# Running
You'll need to run this with standard docker commands, but by default it'll listen on port 8888. 

```
docker run -d -p 8888:8888 mystaticweb:test 
```

HTTP on its own is considered insecure. 
Even if you're not transfering sensitive payloads, its easy to intercept and modify payload. 
If you're going to serve your static website to the internet, you'll need to front this container with something sensible. 

I would recommend cloudflare, and the docker container cloudflared. That's out the scope of this readme, but, just be warned.

Enjoy! 
