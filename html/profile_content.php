<div class="row">
            <div class="col-12 text-center text-white">
              <h1>會員資料修改頁面</h1>
              <p>請輸入相關資料，*為必填欄位</p>
            </div>
          </div>
          <div class="row" id="modify" name="modify">
            <div class="col-8 offset-2 text-left">
              <form action="" id="reg" name="reg" method="GET">

                <div class="input-group mb-3">
                  <input type="email" v-model="member.email" class="form-control" placeholder="*請輸入電子郵件帳號" readonly>
                </div>

                <div class="input-group mb-3">
                  <input type="text" name="cname" id="cname" v-model="member.cname" class="form-control" placeholder="*請輸入姓名" :readonly="readonly">
                </div>

                <div class="input-group mb-3">
                  <input type="text" name="tssn" id="tssn" v-model="member.tssn" class="form-control" placeholder="*請輸入身分證字號" :readonly="readonly">
                </div>

                <div class="input-group mb-3">
                  <input type="text" name="brithday" id="brithday" v-model="member.birthday" onfocus="(this.type='date')" class="form-control" placeholder="*請選擇生日" :readonly="readonly">
                </div>

                <label for="fileToUpload" class="form-label text-white">上傳相片：</label>
                <div class="input-group mb-3" v-show="!readonly">
                  <input type="file" name="fileToUpload" id="fileToUpload" class="form-control" title="請上傳相片" accept="image/x-png,image/jpeg,image/gif,image/jpg"><br>
                  <p><button type="button" class="btn btn-danger" id="uploadForm" name="uploadForm">開始上傳</button></p>
                  <div id="progress-div01" class="progress" style="width: 100%;display:none;">
                    <div id="progress-bar01" class="progress-bar progress-bar-striped" role="progressbar" style="width: 0%;" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">50%</div>
                  </div>
                  <input type="hidden" name="uploadname" id="uploadname" value="" />
                  <img src="" alt="photo" id="showimg" name="showimg" style="display:none;" class="img-fluid">
                </div>

                <div class="input-group mb-3" v-if="readonly">
                  <img :src="`uploads/${(member.imgname)?member.imgname:'avatar.svg'}`" alt="photo" style="width: 20%;" :title="`檔名：${(member.imgname)?member.imgname:'avatar.svg'}`">
                </div>

                <div class="input-group mb-3" v-show="!readonly">
                  <input type="hidden" v-model="captcha" name="captcha" id="captcha" value="">
                  <a href="javascript:void(0);" title="按我更新認證" @onclick="getCaptcha();">
                    <canvas id="can"></canvas>
                  </a>
                  <input type="text" name="recaptcha" id="recaptcha" class="form-control" placeholder="請輸入認證碼">
                  <input type="hidden" name="formctl" id="formctl" value="reg">
                </div>

                <div class="input-group mb-3">
                  <button type="button" class="btn btn-danger btn-lg me-2 text-white" @click="editMember" v-if="readonly">更新會員資料</button>

                  <button type="button" class="btn btn-danger btn-lg text-white" v-if="readonly" data-bs-toggle="modal" data-bs-target="#exampleModal">變更會員密碼</button>

                  <button type="button" class="btn btn-danger btn-lg me-2 text-white" @click="saveMember" v-if="!readonly">儲存資料</button>

                  <button type="button" class="btn btn-secondary btn-lg text-white" @click="readonly=true" v-if="!readonly">離開</button>

                </div>
              </form>
            </div>
            <!-- Modal會員密碼變更模組 -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="fas fa-user-lock me-2"></i>會員密碼變更頁面</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form id="changePW" name="changePW">
                      <div class="mb-3">
                        <label for="PWOld" class="form-label">請輸入舊密碼</label>
                        <input type="password" class="form-control" id="PWOld" name="PWOld" placeholder="Current Password" v-model="PWOld">
                      </div>
                      <div class="mb-3">
                        <label for="PWNew1" class="form-label">請輸入新密碼</label>
                        <input type="password" class="form-control" id="PWNew1" name="PWNew1" placeholder="New Password" v-model="PWNew1">
                      </div>
                      <div class="mb-3">
                        <label for="PWNew2" class="form-label">請再次確認新密碼</label>
                        <input type="password" class="form-control" id="PWNew2" name="PWNew2" placeholder="Verify Password" v-model="PWNew2">
                      </div>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-danger" @click="savePW();">儲存密碼</button>
                    <button id="mClose" name="mClose" type="button" class="btn btn-secondary" data-bs-dismiss="modal">離開</button>
                  </div>
                </div>
              </div>
            </div>
          </div>