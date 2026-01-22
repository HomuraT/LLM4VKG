# GitHub 推送配置指南

## 当前配置信息

- **Git 用户名**: `godehc`
- **Git 邮箱**: `guodehaolzsx@gmail.com`
- **远程仓库**: `git@github.com:HomuraT/LLM4VKG.git`
- **SSH 公钥位置**: `~/.ssh/gdh_llm4vkg.pub`

## 步骤 1: 配置 SSH 密钥到 GitHub

### 1.1 查看你的 SSH 公钥

你的 SSH 公钥内容如下（已保存在 `~/.ssh/gdh_llm4vkg.pub`）：

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOhYTxQLOpVhVwpoU/YGYcZzHqANLovVsOX6P6v5JWQEdCHW64tB6OueFcSqFmox+gZ2nDAxYeGrmjYGA2p4/exHWA9d31sajXDNcboW9k1TMreVbtEvxM3ahJDPLhdc2CYtc6f6KdpkH+mAGC7eoGLM1wWG3bwRKowMzZT1cP4skjmUBhQKL7OYkMUkbwLtrBQQqWGdYti5Xv1JCZawmPBs4e6uqwV0Smvvl+dz6Endz7mlLis+9lZirr92aLWYOJBr6HeCXa1LIhqLihZFASc8dS/rKoyxLDXX+g0gYF5BHwQZ7DJDsHndx9pog5gJiAFO0p6Y06i9Ipz/2pQI9lgXjp3o7BXntm7gxf8M+E7s5DXZebMulOGepIGNBNFyt4A4V8nwQx2+3rNhLLy+JqQzUWWy48DD/cLzx1fLo5IZUxX/6LJpqR5SKTy9LqxaSsxT3rbIi/7bsTtPqkJodM57l/jK3qX4KNrHW0t48Y2FvEdw3bkIizhleUiAsKmSYce9+ChktqXCxNOwBrlsySUQXexROWPMMtqpyfty5rFZU6uriDXvB0Whc2lfBOo3HcdS6HIedykYcZ2TfikWQxAYvjvdFc3WLNgbgU+EfCiuHDyusnAyiOrVvfCIE0ZhqjrKxhFkE8EvsJmDzq5SMSuhdELGTB+Gkk+lsxslYC+w== gdh_llm4vkg@asus-2024
```

### 1.2 将 SSH 公钥添加到 GitHub

1. **登录 GitHub** 并进入设置页面：
   - 访问: https://github.com/settings/keys
   - 或者: GitHub → 右上角头像 → Settings → SSH and GPG keys

2. **添加新的 SSH 密钥**：
   - 点击 "New SSH key" 按钮
   - **Title**: 填写一个描述性名称（如：`LLM4VKG Development`）
   - **Key**: 粘贴上面的完整 SSH 公钥内容（从 `ssh-rsa` 开始到 `@asus-2024` 结束）
   - 点击 "Add SSH key"

### 1.3 配置 SSH config（可选但推荐）

为了确保使用正确的 SSH 密钥，可以创建或编辑 `~/.ssh/config` 文件：

```bash
# 编辑 SSH 配置文件
nano ~/.ssh/config
# 或
vim ~/.ssh/config
```

添加以下内容：

```
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/gdh_llm4vkg
    IdentitiesOnly yes
```

保存后设置正确的权限：

```bash
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/gdh_llm4vkg
chmod 644 ~/.ssh/gdh_llm4vkg.pub
```

### 1.4 测试 SSH 连接

```bash
ssh -T git@github.com
```

如果配置成功，你会看到类似以下的消息：
```
Hi HomuraT! You've successfully authenticated, but GitHub does not provide shell access.
```

## 步骤 2: 提交更改并推送

### 2.1 检查当前状态

```bash
cd /datanfs4/godehc/LLM4VKG
git status
```

### 2.2 添加要提交的文件

```bash
# 添加所有修改的文件（根据 .gitignore 规则自动过滤）
git add .

# 或者只添加特定文件
git add .gitignore readme.md
git add MPR.py OC_MG.py rodi_evaluate.py
# ... 添加其他需要的文件
```

### 2.3 提交更改

```bash
git commit -m "Update .gitignore and readme.md, add new scripts"
```

### 2.4 推送到远程仓库

```bash
# 首次推送，设置上游分支
git push -u origin main

# 之后的推送可以直接使用
git push
```

## 步骤 3: 验证推送结果

推送成功后，访问以下 URL 查看你的代码：
https://github.com/HomuraT/LLM4VKG

## 常见问题

### 问题 1: Permission denied (publickey)

**解决方案**:
1. 确认 SSH 密钥已添加到 GitHub
2. 检查 SSH 密钥权限：`chmod 600 ~/.ssh/gdh_llm4vkg`
3. 测试连接：`ssh -T git@github.com`

### 问题 2: 推送时要求输入密码

**解决方案**:
- 确认使用的是 SSH URL（`git@github.com:...`）而不是 HTTPS URL
- 检查远程地址：`git remote -v`

### 问题 3: 推送被拒绝（rejected）

**解决方案**:
- 如果远程仓库有新的提交，先拉取：`git pull --rebase origin main`
- 然后再推送：`git push origin main`

## 快速命令总结

```bash
# 1. 配置 SSH（如果还没配置）
cat ~/.ssh/gdh_llm4vkg.pub  # 复制这个公钥到 GitHub

# 2. 测试 SSH 连接
ssh -T git@github.com

# 3. 提交并推送
cd /datanfs4/godehc/LLM4VKG
git add .
git commit -m "Your commit message"
git push -u origin main
```
