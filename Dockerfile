# 使用 Node 的版本
FROM node:10.13.0-alpine
 
# FROM node:lts-alpine

# Node 在容器內的位置
WORKDIR /

# 複製 package 設定
COPY ["package.json", "yarn.lock", "./"]

# 第一個 . 是我們本地位置，第二個是 docker 裡面專案的位置，就是將我們專案的程式碼全部複製進去
COPY . .


# 安裝必要的套件並移動到專案的 node_modules 底下
RUN yarn

RUN yarn client:install

# 開放對外的 port
EXPOSE 3000

# start app
CMD ["yarn", "dev"]
