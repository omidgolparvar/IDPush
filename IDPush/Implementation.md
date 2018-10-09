<h1 dir='rtl'>
جزئیات پیاده‌سازی
</h1>

<h2 dir='rtl'>کلاس اصلی</h2>
<p dir='rtl'>
کلاس اصلی برنامه، کلاسی با نام <code>IDPush</code> است. این کلاس در واقع کلاسی‌ست که کاربر با استفاده از آن اقدام به انجام امور خواهد کرد. 
</p>

---

<h2 dir='rtl'>مشخصه‌ها</h2>

<h3 dir='rtl'>کلید ذخیره‌سازی شناسه وان‌سیگنالی در <code>UserDefaults</code></h3>
<ul dir='rtl'>
  <li><b>نوع دسترسی</b>: <code>private static</code></li>
  <li><b>قابل ویرایش</b>: ⛔️</li>
  <li><b>نام</b>: <code>kUserDefaults_PreviousPlayerID</code></li>
  <li><b>نوع داده</b>: <code>String</code></li>
  <li><b>مقدار پیش‌فرض</b>: <code>"IDPush_PreviousPlayerID"</code></li>
</ul>

<br>
<h3 dir='rtl'>آدرس پایه برای ارسال درخواست‌ها به سامانه آی‌دی‌پوش</h3>
<ul dir='rtl'>
  <li><b>نوع دسترسی</b>: <code>private static</code></li>
  <li><b>قابل ویرایش</b>: ⛔️</li>
  <li><b>نام</b>: <code>BaseURL</code></li>
  <li><b>نوع داده</b>: <code>String</code></li>
  <li><b>مقدار پیش‌فرض</b>: <code dir='ltr'>"https://idpush.top/api/v1/"</code></li>
</ul>

<br>
<h3 dir='rtl'>مسیرهای مورد استفاده برای ارسال درخواست‌ها به سامانه</h3>
<ul dir='rtl'>
  <li><b>نوع دسترسی</b>: <code>private static</code></li>
  <li><b>قابل ویرایش</b>: ⛔️</li>
  <li><b>نام</b>: <code>Routes</code></li>
  <li><b>نوع داده</b>: <code>(String, String)</code> : در واقع یه مجموعه هست که داخلش دوتا رشته متنی ذخیره میشه.
  </li>
  <li><b>مقدار پیش‌فرض</b>: <code dir='ltr'>("device/add", "device/edit/")</code></li>
</ul>

<br>
<h3 dir='rtl'>شناسه پروژه تعریف‌شده در سامانه آی‌دی‌پوش</h3>
<ul dir='rtl'>
  <li><b>نوع دسترسی</b>: <code>private static</code></li>
  <li><b>قابل ویرایش</b>: ✅</li>
  <li><b>نام</b>: <code>ProjectID</code></li>
  <li><b>نوع داده</b>: <code>String</code></li>
  <li><b>مقدار پیش‌فرض</b>: <code>""</code></li>
</ul>

<br>
<h3 dir='rtl'>شناسه مشخص‌کننده پیکربندی‌شده بودن</h3>
<ul dir='rtl'>
  <li><b>نوع دسترسی</b>: <code>private static</code></li>
  <li><b>قابل ویرایش</b>: ✅</li>
  <li><b>نام</b>: <code>IsConfigured</code></li>
  <li><b>نوع داده</b>: <code>Bool</code></li>
  <li><b>مقدار پیش‌فرض</b>: <code>false</code></li>
</ul>

<br>
<h3 dir='rtl'>شناسه وان‌سیگنالی دستگاه</h3>
<ul dir='rtl'>
  <li><b>نوع دسترسی</b>: <code>private static</code></li>
  <li><b>قابل ویرایش</b>: ✅</li>
  <li><b>نام</b>: <code>PlayerID</code></li>
  <li><b>نوع داده</b>: <code dir='ltr'>String?</code></li>
  <li><b>مقدار پیش‌فرض</b>: <code>nil</code></li>
</ul>
 
<br>

 ---

<h2 dir='rtl'>نوع داده‌های پیاده‌سازی‌شده</h2>

<h3 dir='rtl'>خطاهای احتمالی در زمان پیکربندی</h3>
<ul dir='rtl'>
  <li><b>نوع دسترسی</b>: <code>private</code></li>
  <li><b>نام</b>: <code>IDPushConfigureError</code></li>
  <li><b>نوع داده</b>: <code dir='ltr'>enum</code></li>
  <li><b>توضیحات</b>: این <code>enum</code> از نوع <code>Error</code> نیز ارث‌بری می‌کند.</li>
  <li><b>زیر مقدارها</b>: <br>
    <ul dir='rtl'>
      <li>گزینه <code>missingProjectID</code>: در زمان پیکربندی، چنانچه ورودی متد پیکربندی، رشته متنی خالی باشد، پیام متناظر با این خطا پرینت میشه.</li>
    </ul>
  </li>
</ul>

<br>

<h3 dir='rtl'>خطاهای احتمالی در زمان انجام گزینه‌ها</h3>
<ul dir='rtl'>
  <li><b>نوع دسترسی</b>: <code>public</code></li>
  <li><b>نام</b>: <code>IDPushActionError</code></li>
  <li><b>نوع داده</b>: <code dir='ltr'>enum</code></li>
  <li><b>توضیحات</b>: این <code>enum</code> از نوع <code>Error</code> نیز ارث‌بری می‌کند. درصورت بروز این خطاها، پیام‌های متناظرشون با استفاده از پرینت به برنامه‌نویس نمایش داده میشن.</li>
  <li><b>زیر مقدارها</b>: <br>
    <ul dir='rtl'>
      <li>گزینه <code>missingDeviceToken</code>: اگر در زمان ثبت دستگاه، شناسه دستگاه خالی وارد شده باشد.</li>
      <li>گزینه <code>missingPlayerID</code>: اگر زمان انجام گزینه‌ها، به <code>playerID</code> نیاز باشد، ولی در دسترس نباشد.</li>
      <li>گزینه <code>isNotConfigured</code>: اگر قبل از انجام گزینه‌ها، آی‌دی‌پوش را پیکربندی نکرده باشیم.</li>
      <li>گزینه <code>invalidResponse</code>: اگر داده دریافتی از سرور معتبر نباشد.</li>
      <li>گزینه <code dir='ltr'>custom(message: String)</code>: این گزینه، یک پارامتر همراه از نوع متنی دارد که برای خطاهایی مورد استفاده قرار می‌گیره که جزء موارد قبلی نباشن؛ مثل خطاهایی که از سمت سرور میان.</li>
    </ul>
  </li>
</ul>

<br>

<h3 dir='rtl'>گزینه‌های انجام‌پذیر در آی‌دی‌پوش</h3>
<ul dir='rtl'>
  <li><b>نوع دسترسی</b>: <code>public</code></li>
  <li><b>نام</b>: <code>IDPushAction</code></li>
  <li><b>نوع داده</b>: <code dir='ltr'>enum</code></li>
  <li><b>توضیحات</b>: هرکدام از المان‌های این نوع داده، در واقع برای یکی از امور انجام‌پذیر و مرتبط با وان‌سیگنال هستند. از این نوع داده در زمان فراخوانی متد انجام مربوط به وان‌سیگنال استفاده خواهیم کرد. با توجه به قابلیت‌های نوع داده <code>enum</code> در زبان سوییفت، هرکدام از این گزینه‌ها، دارای متدها و مشخصه‌هایی هستند که موارد استفاده و توضیح آنها رو در ادامه خواهیم دید.</li>
  <li><b>زیر مقدارها</b>: <br>
    <ul dir='rtl'>
      <li>گزینه <code dir='ltr'>addDevice(token: String)</code>: 
        <ul>
          <li><b>توضیحات</b>: این گزینه برای ثبت دستگاه در وان‌سیگنال مورد استفاده قرار می‌گیره. </li>
          <li><b>پارامتر(های) همراه</b>: 
            این گزینه دارای یه پارامتر همراه هست که نوعش <code>String</code> هست و در واقع مقدارش همون شناسه اپلی دستگاه یا همون <code>APNs Device Token</code> هست.
          </li>
        </ul>
      </li>
      <li>گزینه <code dir='ltr'>subscribe</code>: 
        <ul>
          <li><b>توضیحات</b>: از این گزینه برای ثبت دستگاه برای دریافت نوتیفیکیشن استفاده میشه. دقت داشته باشین که طبق مستندات وان‌سیگنال، دستگاه می‌تونه توی سامانه وان‌سیگنال ثبت شده باشه، ولی برای دریافت نوتیفیکیشن مورد استفاده قرار نگیره. با استفاده از این گزینه، ما داریم به وان‌سیگنال می‌گیم که این دستگاه می‌تونه نوتیفیکیشن دریافت کنه.</li>
          <li><b>پارامتر(های) همراه</b>: ندارد.</li>
        </ul>
      </li>
      <li>گزینه <code dir='ltr'>unsubscribe</code>: 
        <ul>
          <li><b>توضیحات</b>: با استفاده از این گزینه، ما به وان‌سیگنال می‌گیم که این دستگاه نمی‌تونه نوتیفیکیشن دریافت کنه. در نتیجه وان‌سیگنال هم تحت هیچ شرایطی برای این دستگاه نوتیفیکیشن نمی‌فرسته.</li>
          <li><b>پارامتر(های) همراه</b>: ندارد.</li>
        </ul>
      </li>
      <li>گزینه <code dir='ltr'>setTags(tags: [String: Any])</code>: 
        <ul>
          <li><b>توضیحات</b>: این گزینه برای تنظیم‌کردن تگ‌های وان‌سیگنال مورد استفاده قرار می‌گیره.</li>
          <li><b>پارامتر(های) همراه</b>: پارامتر همراه این گزینه، یه دیکشنری هست که کلیدهاش از نوع <code>String</code> و مقدارهای متناظر کلیدها از نوع <code>Any</code> (یا همون <b>هرچی</b> خودمون) هست.</li>
        </ul>
      </li>
      <li>گزینه <code dir='ltr'>editDevice(parameters: [String: Any])</code>: 
        <ul>
          <li><b>توضیحات</b>: این گزینه، گزینه کلی ویرایش دستگاه توی وان‌سیگنال هست. </li>
          <li><b>پارامتر(های) همراه</b>: پارامتر همراه این گزینه، مثل پارامترهای همراه گزینه تنظیم تگ‌ها، یه دیکشنری هست که کلیدهاش از نوع <code>String</code> و مقدارهای متناظر کلیدها از نوع <code>Any</code> (یا همون <b>هرچی</b> خودمون) هست.</li>
        </ul>
      </li>
    </ul>
  </li>
  <li><b>متدهای مربوط به گزینه‌ها</b>: <br>
    <ul>
      <li>متد آماده‌سازی پارامترهای درخواست برای ارسال به سامانه آی‌دی‌پوش.
        <ul>
          <li><b>نام</b>: <code dir='ltr'>getParameters()</code></li>
          <li><b>نوع داده خروجی</b>: <code dir='ltr'>[String: Any]</code></li>
          <li><b>نحوه محاسبه</b>: <br>
          یه سری پارامتر هست که برای همه گزینه‌ها استفاده میشه و در واقع پارامترهای اشتراکی بین همه درخواست‌ها هستن.<br>
          لیست پارامترهای اشتراکی بصورت زیر هست:
            <ul>
              <li>این پارامتر برابر شناسه پروژه تعریف‌شده توی آی‌دی‌پوش هست و از خود <code>IDPush</code> دریافت میشه.<br>
                <code dir='ltr'>parameter["project_id"] = IDPush.ProjectID</code>
              </li>
              <li>این پارامتر نوع دستگاه رو برای وان‌سیگنال مشخص می‌کنه.<br>
                <code dir='ltr'>parameter["device_type"] = 0</code>
              </li>
              <li>این پارامتر در واقع نسخه اپ هست که با استفاده از <code>API</code> خود اپل از باندل گرفته میشه.<br>
                <code dir='ltr'>parameter["game_version"] = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String</code>
              </li>
              <li>این پارامتر برای مشخص کردن مدل دستگاه استفاده میشه. برای سوییفتش، از کتابخانه <code>UIDeviceComplete</code> استفاده شده.<br>
                <code dir='ltr'>parameter["device_model"] = UIDevice.current.dc.deviceModel</code>
              </li>
              <li>این پارامتر برای مشخص کردن نسخه سیستم عامل دستگاه استفاده میشه. برای سوییفتش، از کتابخانه <code>UIDeviceComplete</code> استفاده شده.<br>
                <code dir='ltr'>parameter["device_os"] = UIDevice.current.systemVersion</code>
              </li>
            </ul>
            <p dir='rtl'>بعد از پارامترهای اشتراکی، پارامترهای دیگه‌ای هم هستن که براساس نوع گزینه مورد استفاده تعیین و تنظیم میشن:<br>
            <ul>
              <li>برای گزینه <code dir='ltr'>.addDevice(let token)</code> :<br>
                <pre style=" text-align: left;">parameter["identifier"] = token
parameter["notification_types"] = 1
var isForTest: Bool = true
#if DEBUG
    isForTest = true
#else
    isForTest = false
#endif
parameter["test_type"] = isForTest ? 1 : 2</pre>
              </li>
              <li>برای گزینه <code dir='ltr'>.subscribe</code> :<br>
                <pre style=" text-align: left;">parameter["player_id"] = IDPush.PlayerID!
parameter["notification_types"] = 1</pre>
              </li>
              <li>برای گزینه <code dir='ltr'>.unsubscribe</code> :<br>
                <pre style=" text-align: left;">parameter["player_id"] = IDPush.PlayerID!
parameter["notification_types"] = -2</pre>
              </li>
              <li>برای گزینه <code dir='ltr'>.setTags(let tags)</code> :<br>
                <pre style=" text-align: left;">parameter["player_id"] = IDPush.PlayerID!
parameter["notification_types"] = 1
parameter["tags"] = JSON(tags).rawString(.utf8, options: []) ?? ""</pre>
              </li>
              <li>برای گزینه <code dir='ltr'>.editDevice(let parameters)</code> :<br>
                <pre style=" text-align: left;">parameter["player_id"] = IDPush.PlayerID!
parameters.forEach({ parameter[$0.key] = $0.value })</pre>
              </li>
            </ul>
            </p>
          </li>
        </ul>
      </li>
      <li>متد تولید و دریافت آدرس مورد استفاده برای ارسال درخواست به سامانه.
        <ul>
          <li><b>نام</b>: <code dir='ltr'>getURL()</code></li>
          <li><b>نوع داده خروجی</b>: <code dir='ltr'>URL</code></li>
          <li><b>نحوه محاسبه</b>: <br>
            <ul>
              <li>برای گزینه <code dir='ltr'>.addDevice(let token)</code> :<br>
                <code dir='ltr'>URL(string: IDPush.BaseURL + IDPush.Routes.addDevice)!</code>
              </li>
              <li>
                برای گزینه‌های <code dir='ltr'>.subscribe</code> و 
                <code dir='ltr'>.unsubscribe</code> و 
                <code dir='ltr'>.setTags(let tags)</code> و 
                <code dir='ltr'>.editDevice(let parameters)</code> :<br>
                <code dir='ltr'>URL(string: IDPush.BaseURL + IDPush.Routes.editDevice + IDPush.PlayerID!)!</code>
              </li>
            </ul>
            </p>
          </li>
        </ul>
      </li>
      <li>متد اعتبارسنجی و بررسی امکان انجام‌شدن گزینه‌ها.
        <ul>
          <li><b>نام</b>: <code dir='ltr'>validateBeforePerform() throws</code></li>
          <li><b>نوع داده خروجی</b>: ندارد</li>
          <li><b>نحوه محاسبه</b>: <br>
            <ul>
              <li>برای گزینه <code dir='ltr'>.addDevice(let token)</code> :<br>
                <code dir='ltr'>guard !token.isTrimmedAndEmpty else { throw IDPushActionError.missingDeviceToken }</code>
                <br>👈 در واقع برای این گزینه، لازم است که توکن همراه این گزینه، یک رشته متنی خالی <b>نباشد</b>.
              </li>
              <li>
                برای گزینه‌های <code dir='ltr'>.subscribe</code> و 
                <code dir='ltr'>.unsubscribe</code> و 
                <code dir='ltr'>.setTags(let tags)</code> و 
                <code dir='ltr'>.editDevice(let parameters)</code> :<br>
                <code dir='ltr'>guard IDPush.PlayerID != nil else { throw IDPushActionError.missingPlayerID }</code>
                <br>👈 در واقع برای این گزینه‌ها، با توجه به اینکه برای یه شناسه وان‌سیگنالی داره یه عملیاتی انجام میشه، نیاز هست که شناسه وان‌سیگنالی یا همون <code>PlayerID</code> برابر <code>nil</code> <b>نباشه</b>.
              </li>
            </ul>
            </p>
          </li>
          <li><b>توضیحات</b>: در واقع این متد اعتبارسنجی داخل یه  <code dir='ltr'>do { } catch { }</code> فراخوانی میشه، تا اینجوری خطایی که برمیگرده رو بگیریم و پیام متناظر با اون خطا رو چاپ کنیم.
          </li>
        </ul>
      </li>
    </ul>
  </li>
</ul>





<br>

---

<h2 dir='rtl'>متدها</h2>

<h3 dir='rtl'>پیکربندی یا <code>Setup</code></h3>
<ul dir='rtl'>
  <li>
    <b>نوع دسترسی</b>
    <ul dir='rtl'>
      <li><code>public static</code>
      </li>
    </ul>
  </li>
  <li>
    <b>ورودی‌ها</b>
    <ul dir='rtl'>
      <li><code>projectID </code>
        <ul>
          <li><b>نوع داده</b>: <code>String</code></li>
          <li><b>توضیحات</b>: این پارامتر در واقع همون شناسه‌ای هست که به برنامه‌نویس در زمان ساخت پروژه توی پنل آی‌دی‌پوش، بهش داده میشه.</li>
        </ul>
      </li>
    </ul>
  </li>
  <li>
    <b>خروجی</b>
    <ul dir='rtl'>
      <li><b>ندارد</b>
      </li>
    </ul>
  </li>
  <li>
    <b>توضیحات</b>
    <p dir='rtl'>
    این متد برای پیکربندی آی‌دی‌پوش توی برنامه مورد استفاده قرار می‌گیره. 
    توی این متد، 
    <ul dir='rtl'>
      <li>اول مقدار ورودی متد trim میشه تا فاصله‌های اضافی اول و آخرش حذف بشه.</li>
      <li>بعد اون مقدار trim شده رو بررسی می‌کنیم تا خالی نباشه. 
        <ul><li>اگه مقدار بدست اومده خالی بود، یه پیام برای برنامه‌نویس پرینت می‌کنیم و از متد خارج می‌شیم تا روند ادامه پیدا نکنه.</li>
        </ul>
      </li>
      <li>اگه مقدار نهایی مشکلی نداشت، 
        <ul>
          <li>این مقدار بدست‌اومده رو داخل متغیر استاتیک <code>ProjectID</code> ذخیره‌اش می‌کنیم. چون هم متد از نوع استاتیک هست و هم متغیر <code>ProjectID</code> از نوع استاتیک هست، نیازی به تعریف شی و اینا نیست.
          </li>
          <li>همچنین مقدار مشخصه <code>IsConfigured</code> رو برابر <code>true</code> قرار می‌دیم.</li>
        </ul>
      <br>
      👈 در واقع همه متدها و مشخصه‌های مورد استفاده از نوع استاتیک در نظر گرفته شدن، تا بدون نیاز به تعریف شی از کلاس، بهشون دسترسی داشته باشیم.
      </li>
    </ul>
    </p>
  </li>
</ul>

<br>
<h3 dir='rtl'>دریافت شناسه کاربر برای پوش نوتیفیکیشن یا <code>GetPlayerID</code></h3>
<ul dir='rtl'>
  <li>
    <b>نوع دسترسی</b>
    <ul dir='rtl'>
      <li><code>public static</code>
      </li>
    </ul>
  </li>
  <li>
    <b>ورودی</b>
    <ul dir='rtl'>
      <li><b>ندارد</b></li>
    </ul>
  </li>
  <li>
    <b>خروجی</b>
    <ul dir='rtl'>
      <li><b>نوع داده</b>: <code dir='ltr'>String?</code></li>
      <li><b>توضیحات</b>: شناسه کاربر جهت ارسال پوش نوتیفیکیشن.</li>
    </ul>
  </li>
  <li>
    <b>توضیحات</b>
    <p dir='rtl'>
    این متد شناسه وان‌سیگنالی کاربر رو برمی‌گردونه. البته مقدار خروجی می‌تونه برابر <code>nil</code> هم باشه. روند اجرای بدنه متد بصورت زیر هست:
    <ul dir='rtl'>
      <li>اول بررسی می‌کنیم که مشخصه <code>PlayerID</code> دارای مقدار هست یا نه. (چک می‌کنیم که <code>nil</code> نباشه)
        <ul dir='rtl'>
          <li>اگه دارای مقدار بود، همون مقدار رو بعنوان خروجی متد برمی‌گردونیم.</li>
        </ul>
      </li>
      <li>اگه <code>PlayerID</code> مقدار نداشت و برابر <code>nil</code> بود، میایم و مقدار ذخیره‌شده توی <code>UserDefaults</code> رو بررسی می‌کنیم.
      مقداری که قرار هست از <code>UserDefaults</code> خونده بشه، دارای کلیدی با مقدار ذخیره‌شده توی مشخصه <code>kUserDefaults_PreviousPlayerID</code> هست و نوع مقدار ذخیره‌شده هم <code>String</code> خواهد بود.
      اگه مقداری توی <code>UserDefaults</code> برای کلید مورد نظر ذخیره شده بود،
        <ul dir='rtl'>
          <li>مقدار مشخصه <code>PlayerID</code> رو برابر این مقدار خونده‌شده قرار می‌دیم. تا توی دفعات بعدی، نیاز نباشه از <code>UserDefaults</code> خونده بشه.</li>
          <li>و این مقدار رو بعنوان خروجی متد در نظر می‌گیریم و برش می‌گردونیم.</li>
        </ul>
      </li>
      <li>
        در نهایت اگه هیچ‌کدوم از شرایط بالا اجرایی نشدن، مقدار <code>nil</code> رو بعنوان خروجی برمی‌گردونیم.
        <br><br>
        👈 اینکه مقدار <code>nil</code> برگرده، یعنی قبلا هیچ <code>PlayerID</code> دریافت و ذخیره نشده.
      </li>
    </ul>
  </li>
</ul>

<br>
<h3 dir='rtl'>ذخیره شناسه وان‌سیگنالی یا <code>StorePlayerID</code></h3>
<ul dir='rtl'>
  <li>
    <b>نوع دسترسی</b>
    <ul dir='rtl'>
      <li><code>private static</code>
      </li>
    </ul>
  </li>
  <li>
    <b>ورودی‌ها</b>
    <ul dir='rtl'>
      <li><code>playerID </code>
        <ul>
          <li><b>نوع داده</b>: <code>String</code></li>
          <li><b>توضیحات</b>: این مقدار، شناسه وان‌سیگنالی هست که موقع ثبت اطلاعات دستگاه، سامانه به ما میده.</li>
        </ul>
      </li>
    </ul>
  </li>
  <li>
    <b>خروجی</b>
    <ul dir='rtl'>
      <li><b>ندارد</b>
      </li>
    </ul>
  </li>
  <li>
    <b>توضیحات</b>
    <p dir='rtl'>
    زمانیکه روند ثبت اطلاعات دستگاه طی میشه، در پاسخ سرور، شناسه وان‌سیگنالی دستگاه تحویل داده میشه و نیاز هست که این مقدار ذخیره بشه تا در صورت نیاز، بتونیم بهش دسترسی داشته باشیم. کار این متد، همین ذخیره‌سازی این شناسه هست. روند ذخیره‌سازی هم بصورت زیر هست:
      <ul dir='rtl'>
        <li>اول مشخصه <code>PlayerID</code> رو برابر این مقدار ورودی قرار میدیم.</li>
        <li>همین مقدار ورودی رو برای استفاده‌های بعدی، توی <code>UserDefaults</code> هم ذخیره می‌کنیم.
        <br>
        کلیدی که برای ذخیره توی <code>UserDefaults</code> استفاده می‌کنیم، مقدار ذخیره‌شده توی <code>kUserDefaults_PreviousPlayerID</code> هست.
        </li>
      </ul>
    </p>
  </li>
</ul>


<br>
<h3 dir='rtl'>انجام گزینه‌ها و بررسی نتیجه انجام یا <code>Perform</code></h3>
<ul dir='rtl'>
  <li>
    <b>نوع دسترسی</b>
    <ul dir='rtl'>
      <li><code>public static</code>
      </li>
    </ul>
  </li>
  <li>
    <b>ورودی‌ها</b>
    <ul dir='rtl'>
      <li><code>action</code>
        <ul>
          <li><b>نوع داده</b>: <code>IDPushAction</code> که درواقع یه <code>enum</code> هست.</li>
          <li><b>توضیحات</b>: این پارامتر مشخص‌کننده اینه که برنامه‌نویس می‌خواد چیکار کنه؛ مثلا می‌خواد یه دستگاه ثبت کنه.</li>
        </ul>
      </li>
      <li><code>callback</code>
        <ul>
          <li><b>نوع داده</b>: <code dir='ltr'>(IDPushActionError?, Any?) -> Void</code></li>
          <li><b>توضیحات</b>: این پارامتر در واقع <code>closure</code>ی هست که بعد از انجام گزینه ورودی، فراخوانی میشه و پارامترهای همراهش هم براساس نتیجه انجام اون عمل، مقداردهی میشن. پارامتر اولش خطای احتمالی رو مشخص می‌کنه که نوعش توی قسمت «نوع داده‌ها» توضیح داده شده و همچنین می‌تونه مقدار <code>nil</code> داشته باشه و اگه مقدارش <code>nil</code> باشه، به این معنیه که انجام گزینه ورودی، با موفقیت انجام شده. اگه هم توی روند انجام گزینه ورودی خطایی پیش بیاد، همین پارامتر مشخص‌کننده اون خطا خواهد بود.<br>پارامتر دوم هم از نوع <code>Any?</code> در نظر گرفته شده، و خروجی سرور رو منتقل می‌کنه. </li>
        </ul>
      </li>
    </ul>
  </li>
  <li>
    <b>خروجی</b>
    <ul dir='rtl'>
      <li><b>ندارد</b>
      </li>
    </ul>
  </li>
  <li>
    <b>توضیحات</b>
    <p dir='rtl'>
      روند انجام گزینه‌ها بصورت زیر هست:
      <ul dir='rtl'>
        <li>اول از همه بررسی می‌کنیم که آی‌دی‌پوش پیکربندی شده باشه. این کار با بررسی <code>IsConfigured</code> انجام میشه. <br>
        اگه مقدارش <code>false</code> بود:
          <ul>
            <li>پیام متناظر با خطای <code>IDPushActionError.isNotConfigured</code> رو پرینت می‌کنیم.</li>
            <li>اون <code>closure</code> رو بهمراه پارامترهای <code>IDPushActionError.isNotConfigured</code> و <code>nil</code> فراخوانی‌اش می‌کنیم.</li>
            <li>از متد خارج می‌شیم تا روند ادامه پیدا نکنه.</li>
          </ul>
        </li>
        <li>قدم بعدی اینه که خود اون گزینه ورودی برای انجام رو اعتبارسنجی کنیم. این کار با استفاده از متد <code dir='ltr'>validateBeforePerform()</code> انجام میشه. این عمل با استفاده از <code dir='ltr'>do { } catch { }</code> انجام میشه.<br> اگه خطایی رخ بده:
          <ul>
            <li>پیام متناظر با خطای دریافت‌شده رو پرینت می‌کنیم.</li>
            <li>اون <code>closure</code> رو بهمراه پارامترهای خطای دریافتی و <code>nil</code> فراخوانی‌اش می‌کنیم.</li>
            <li>از متد خارج می‌شیم تا روند ادامه پیدا نکنه.</li>
          </ul>
        </li>
        <li>قدم بعدی، ارسال درخواست متناظر با گزینه ورودی هست:
          <ul>
            <li>متد مورد نظر برای همه درخواست‌ها <code>POST</code> هست.</li>
            <li>آدرس نهایی درخواست رو از طریق متد <code dir='ltr'>getURL()</code> بدست میاریم.</li>
            <li>پارامترهایی که قرار هست توی <code>HTTP-Body</code> بفرستیم رو با استفاده از متد <code dir='ltr'>getParameters()</code> بدست میاریم.</li>
            <li>پاسخ دریافتی از سرور با فرمت <code>JSON</code> خواهد بود.</li>
            <li>همه درخواست‌ها توی پاسخ دریافتی از سرور دارای یه مقدار به نام <code>status</code> از نوع عددی هستن که اگه مقدارش برابر <b>یک</b> بود یعنی همه‌چی اوکی بوده، و اگه مقدارش برابر <b>صفر</b> بود هم به این معنیه که یه خطایی رخ داده. پس برای بررسی جواب دریافتی از سرور اینجوری عمل می‌کنیم:
              <ul>
                <li>می‌تونیم اول از همه این رو چک کنیم که <code>HTTP Status Code</code> دریافتی برابر <code>200</code> باشه.</li>
                <li>بعدش مقدار این کلید <code>status</code> رو بررسی می‌کنیم.</li>
                <li>اگه دوتا مورد قبلی درست بود، همه‌چی اوکی هست. فقط برای گزینه <code dir='ltr'>.addDevice(token: String)</code> یه قدم کوچک دیگه هم داریم. <br>
                برای این درخواست، توی پاسخ دریافتی سرور، یه کلید دیگه هم هست به اسم <code></code> که مقدار متناظرش از نوع <code>String</code> هست. این مقدار، در واقع شناسه وان‌سیگنالی دستگاه ثبت شده هست؛ و باید ذخیره بشه. ذخیره‌کردنش هم با استفاده از متد <code dir='ltr'>IDPush.StorePlayerID(playerID: String)</code> انجام میشه.
                </li>
                <li>در نهایت:
                  <ul>
                    <li>اگه به خطایی خوردیم، یا پاسخ دریافتی سرور مشکل داشت و کلیدهای مورد انتنظار رو نداشت، <code>callback</code> رو بهمراه پارامترهای <code>IDPushActionError.invalidResponse</code> و <code>data</code> فراخوانی می‌کنیم. این <code>data</code> در واقع همون اطلاعات دریافتی از سرور هست.</li>
                    <li>اگه به خطایی برخورد نکردیم و همه‌چی همونطور پیش رفت که می‌خواستیم، <code>callback</code> رو با پارامترهای <code>nil</code> و <code>data</code> فراخوانی‌اش می‌کنیم.</li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </li>
      </ul>
    </p>
  </li>
</ul>

<br>
<h2 dir='rtl'>در نهایت</h2>
<p dir='rtl'>
سوالی داشتین، بپرسین.
<br>
😎
</p>

