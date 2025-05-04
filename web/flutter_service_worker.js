'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "10ad5fbe47442054b9b339604b42bdd7",
"assets/AssetManifest.bin.json": "ff64fd348fbe9edf29dd5ca1ec1cd5ec",
"assets/AssetManifest.json": "97919cf2b6d14037e82dd8c80cc9812b",
"assets/assets/fonts/jost/Roboto-Bold.ttf": "36b5bab58a18b9c924861a4ccbf1a790",
"assets/assets/fonts/jost/Roboto-Medium.ttf": "9745415b8a2a8b9a2480a12f7e2d3ad3",
"assets/assets/fonts/jost/Roboto-Regular.ttf": "5673da52c98bb6cb33ada5aaf649703e",
"assets/assets/fonts/MaterialIcons-Regular.otf": "6fbee4d8d8ab392e604d0b0c1e2eb75b",
"assets/assets/icons/alarmsvg.svg": "f9d7e7666e15619073ff08a1f11a4089",
"assets/assets/icons/arrowleft.svg": "26e7f28c226bf8a997b5079d57627895",
"assets/assets/icons/arrowright.svg": "e1e04cfcd1b847cf40f30b64d6db8ac8",
"assets/assets/icons/battery_low.svg": "354ea1d6fdd677046d0221ff3d31cf77",
"assets/assets/icons/bell.svg": "67004729f2fce06bc7541f5422d45207",
"assets/assets/icons/bicycle.svg": "c10f2ea2c696dd4348714ffa59e996f3",
"assets/assets/icons/bookmark.svg": "3b68a7b6ad1a8b6a87ae9686487a5b54",
"assets/assets/icons/box.svg": "addb98e032df2c79bca89d9f71bd0ead",
"assets/assets/icons/buy.svg": "3a4c86cf283c823396ce5d7b9079df26",
"assets/assets/icons/calendar.svg": "86b700946d5a8bef46448da07c98afe4",
"assets/assets/icons/calendar_list.svg": "53b614843e74c7698c6ee6b1c25b4217",
"assets/assets/icons/calling.svg": "84ee7aaf6193bcf8340152cd503cfd95",
"assets/assets/icons/callsm.svg": "0de9b09a76a350f27c276ba30867b491",
"assets/assets/icons/camera.svg": "cc597be3ae4c298fdbab78e469579f83",
"assets/assets/icons/cancel.svg": "a9a2c8c48c77dc87f1bf28043a4e10f3",
"assets/assets/icons/cancelbig.svg": "f77f5f6f495b13cda9b044a2734ef21b",
"assets/assets/icons/cancel_small.svg": "df3b6414b55e61da55469cf6140a04a7",
"assets/assets/icons/car.svg": "3cb054b1d23a18a880fcd072bcec88c7",
"assets/assets/icons/chart.svg": "8f1fff32cb9570be4ae7634ffcb2bc2d",
"assets/assets/icons/chat.svg": "08e11556df0df1f04276751c3e18ddd6",
"assets/assets/icons/chatbot.svg": "56400c8c7af6f56434b275c9a8b3bab3",
"assets/assets/icons/chatting.svg": "c2050883eae0eb45d9d84685ba4d5636",
"assets/assets/icons/chatting_new.svg": "53025092f7ffc83e8f0182fe2a0d2917",
"assets/assets/icons/check.svg": "cba9f3837f8cb80f7285ab1cd1288f91",
"assets/assets/icons/chevron_double__down.svg": "c2a54ca0f52e06658b6b0fb38934a0d3",
"assets/assets/icons/chevron_double__left.svg": "946786027ae873007984e80072826b87",
"assets/assets/icons/chevron_double__right.svg": "a9f4def29533ce9e89a07884d4810735",
"assets/assets/icons/chevron_double__up.svg": "aad5039d38101bc5493acbcc0ae3a8d4",
"assets/assets/icons/chevron__down.svg": "c91e8ce93c5d5107c600cd739b85bd6f",
"assets/assets/icons/chevron__left.svg": "81767bd00fa4a95ac907ab66e115d25d",
"assets/assets/icons/chevron__right.svg": "40d5c3586643522b37316c0f47a064b6",
"assets/assets/icons/chevron__up.svg": "2148ba21d4f095215dc9139e4ac51775",
"assets/assets/icons/close.svg": "11d023afd03464606e7396c24a55c78f",
"assets/assets/icons/closesmall.svg": "0d7cfa45d9eb4652010aeb26b762852c",
"assets/assets/icons/closesmall1.svg": "bdf669e82aa75371e73a2f4e6fa22806",
"assets/assets/icons/close_square.svg": "a67dde0c587a249243fd00b2ceb76226",
"assets/assets/icons/colon.svg": "12f1f95ac5805444aa00524b499ad8a7",
"assets/assets/icons/color.svg": "21b39e0246c82f04038f22edbd9b5aff",
"assets/assets/icons/copy.svg": "cec980fcdd84508adfc39d91076a8bc6",
"assets/assets/icons/coupon.svg": "e20c3a52c73c29f2163137489ab563e3",
"assets/assets/icons/crop.svg": "b0731d0a43ac7c41896aa0ea455f0a0e",
"assets/assets/icons/customercenter.svg": "8bd544637660ea98fd6d187234b4089e",
"assets/assets/icons/customerservice.svg": "6d8db3879b44acc3e02a149e259d8618",
"assets/assets/icons/danger_circle.svg": "cb4eefb15733a76c19199b93b70f65db",
"assets/assets/icons/danger_triangle.svg": "67eb9547dfdb154386364fb7e5e06439",
"assets/assets/icons/delete.svg": "de9a5cdff662d7c37c01966c5dba18be",
"assets/assets/icons/delivered.svg": "ca1cc01244cea81af6938d26eb3e7f48",
"assets/assets/icons/delivering.svg": "8a8d25000f7a02911ddf8ecf0f549b7a",
"assets/assets/icons/discount.svg": "7bde62f82947b7abc33392b4971951b7",
"assets/assets/icons/discovery.svg": "4d07a6579d269bdf26462321ac55501c",
"assets/assets/icons/dollar.svg": "9df5b208c849fdc0ea3134cac5422e93",
"assets/assets/icons/dollarcircleline.svg": "8cad982938e1bb193ebc9bb6c53df792",
"assets/assets/icons/done.svg": "8ac8afa5f7a54f51ad45aec3c42602a0",
"assets/assets/icons/done__badge.svg": "bcde93ac3e1eebd07679028eec25c5bb",
"assets/assets/icons/done__round.svg": "26db61d1e3cead6a4844901e7319eef5",
"assets/assets/icons/download.svg": "bd6b7feea1f7c0ed8e0d6163b8f195f3",
"assets/assets/icons/dragvertical.svg": "7b5cac81f62c07ab9d45c092d3f08734",
"assets/assets/icons/edit.svg": "171c18c0cfbb4ca0af8487b3490e9678",
"assets/assets/icons/eighteenplus2.svg": "f0d02fe99a966d5ea4d966260bcb4ebc",
"assets/assets/icons/eighteen_plus.svg": "ee73797c4a617f779ed6cdd52e2b7069",
"assets/assets/icons/eigtheen_check.svg": "9abfeff48f137905ac6e619743fddcc5",
"assets/assets/icons/empty.svg": "35f511b8987cb1e89030a6ca4c1303a7",
"assets/assets/icons/eraser.svg": "16e1da5c53d37fcb55851ed25d71eea8",
"assets/assets/icons/eye.svg": "fad2b57702760fa7da6bcd3cb74238e5",
"assets/assets/icons/eye_slash.svg": "bd3ba7dc6f513c16a3d3327883891119",
"assets/assets/icons/fill_icons.svg": "ffb26886de7725aed7774698da8df717",
"assets/assets/icons/flagrounded.svg": "5c1d846154dcf21ec5142a4519e4d008",
"assets/assets/icons/flash__circle.svg": "16950d63e4b1767eadf5c58a238bbb30",
"assets/assets/icons/fragile.svg": "bb7846f1703d64fd7170fe2c997dca5b",
"assets/assets/icons/game.svg": "ac8f7417f0eb77f1dd62adaf7e542bae",
"assets/assets/icons/gift.svg": "31bbf15d88d43d6e159036ac5b52735d",
"assets/assets/icons/gird.svg": "85222caec56950f157167b770340d405",
"assets/assets/icons/gps.svg": "6bf0e9c4689321af02b2811ef495e2fd",
"assets/assets/icons/graph.svg": "82c21625e11eaa79fb560e38bd7f0910",
"assets/assets/icons/group.svg": "fb72de4a15dca870dfb6f20506be5ee2",
"assets/assets/icons/heart.svg": "bd3ecfd9c7ac4ecedf13ae9984062d34",
"assets/assets/icons/helmet.svg": "f6c4bfd2a348cb6a8edad7a95a9497f8",
"assets/assets/icons/history.svg": "b20fdf6b9f689d87c178a00a72de5973",
"assets/assets/icons/home.svg": "99c87df5183d146c11e52ed981df311e",
"assets/assets/icons/icecrystal.svg": "35ba1a48790556ff136017c1d6c3598b",
"assets/assets/icons/ic_twotonedraghandle.svg": "cdbb41db18336a363b48deaf061ad8da",
"assets/assets/icons/image.svg": "caccd9e5c3a8240db42c3c48957bffd0",
"assets/assets/icons/imessage.svg": "dddbdc05ef620f5174872812692e3267",
"assets/assets/icons/info.svg": "9bc696eeaa646678f047cbc415957337",
"assets/assets/icons/kilogram.svg": "71f56a7b10c9bf8da1175e51cd14e5a1",
"assets/assets/icons/layer.svg": "f60f69f77782073e66ee9b72f8f45860",
"assets/assets/icons/layer_open.svg": "6a28be2895ffe1ba862543b33bada130",
"assets/assets/icons/light.svg": "fa776ae2332c3e6a72d72a732ec4bbc4",
"assets/assets/icons/lightban.svg": "8ee2a411fea249e41969f76a3b2c65d2",
"assets/assets/icons/link.svg": "6478985c138e16c8cc56e22c94f96085",
"assets/assets/icons/list.svg": "7ff5dda98296a2ae92ca22b714621314",
"assets/assets/icons/listcircle.svg": "33f28cd1123dc6a87fc231451b0d32bf",
"assets/assets/icons/listcircleasap.svg": "edb38f52d8e2a279b59a98999bd76b9f",
"assets/assets/icons/listcircleother.svg": "de566b3623661c4e9b48e3864f35fa5c",
"assets/assets/icons/listcirclesolid.svg": "8e2bee66ebc237f4169054ac1aa8f272",
"assets/assets/icons/location.svg": "d854f8ce340cf8e46fdfe7d01d45577a",
"assets/assets/icons/lock.svg": "4a7dfed386d762dc0b16640bf0200e9a",
"assets/assets/icons/mapoutline.svg": "2b3e6f54e66387e51c7835565447ddaa",
"assets/assets/icons/medicine.svg": "29dd59e7f065283d8788c11266c11158",
"assets/assets/icons/memo.svg": "76c4a4c293ab0130d955736d560368bc",
"assets/assets/icons/menu.svg": "aca44ac98cbb0db759af77331120369b",
"assets/assets/icons/menuleft.svg": "f17e42fc04c952c0df43d2514c9a140b",
"assets/assets/icons/menuright.svg": "66b6863932734a5f07b210d87b6287a7",
"assets/assets/icons/message.svg": "dddbdc05ef620f5174872812692e3267",
"assets/assets/icons/messages.svg": "e6117798f39f505ceb522dab0a0788fc",
"assets/assets/icons/minus.svg": "591c7f3291cb0efa24ba457eb620ad89",
"assets/assets/icons/more.svg": "618e8642bb3a8e8fcec80029786e0874",
"assets/assets/icons/morecircle.svg": "b430707b6db92f42ede917850a7446b4",
"assets/assets/icons/more_2.svg": "9177ecdedbbb5360d82f0ad673918a09",
"assets/assets/icons/motorcycle.svg": "8f9ea4f6c8423eb763d45be9662977f5",
"assets/assets/icons/navigationarrow.svg": "4ebf68afa661fac29fef3e9eb20363a9",
"assets/assets/icons/off.svg": "6d68a3ae3ec506c53391f9a7a27e3d27",
"assets/assets/icons/on.svg": "f35e285f12d50ee8e2c4f482ed2f84cc",
"assets/assets/icons/one.svg": "df5f41b17cbf700f7a57b7d0a7e39bc2",
"assets/assets/icons/order.svg": "1687dd362ed6e766d9128db196458192",
"assets/assets/icons/orginId.svg": "22ddc4c55da0c531bdf928df03db74f3",
"assets/assets/icons/origin.svg": "cf857cfb94d562a8db509b2142ce2f7d",
"assets/assets/icons/paper.svg": "346ee8e5099f76bed177410025045170",
"assets/assets/icons/paper_download.svg": "52b21d3961b96be35e521e1fe1f49af3",
"assets/assets/icons/paper_fail.svg": "a4c406a005cb737210e1adc0d822a984",
"assets/assets/icons/paper_negative.svg": "2079eaad6f118e62b8b47bce83658182",
"assets/assets/icons/paper_plus.svg": "bbee9541585dcb80a53f7b29b74dc24a",
"assets/assets/icons/paper_upload.svg": "bd132a28d5e942c0b1c147b18e242cfa",
"assets/assets/icons/passport.svg": "3c072bd63718fe282211edad82569f8d",
"assets/assets/icons/pay.svg": "f4601a7b5294a78be4625484ce3cc3ba",
"assets/assets/icons/pin.svg": "74439a75a9f3cadbbf06d6da08850c3e",
"assets/assets/icons/plus.svg": "5ed4d481c2c918099c795f8c6c4ca9ee",
"assets/assets/icons/plus__round.svg": "f89033160b522c4f6a3cd7cf4e20be5c",
"assets/assets/icons/plus__round_small.svg": "665e253de0b4e56db8483a94fc89bc6f",
"assets/assets/icons/plus__small.svg": "9a3cb1d513ab57035fbc94985d85bfd6",
"assets/assets/icons/point.svg": "4205cf53c798d3daed2f6fd80b8e28f0",
"assets/assets/icons/profile.svg": "7712919c5939c3d1e8d6e0bd5dc496f0",
"assets/assets/icons/profile_default.svg": "85b1dcbc2b76ee7ef271961c02b28476",
"assets/assets/icons/question.svg": "60d0d1204e68dad794eab502d26ce5dd",
"assets/assets/icons/questionmark.svg": "87c0dc4c7e285d57c1ee6c823848a780",
"assets/assets/icons/receive_mail.svg": "161e1743e508017118af191302d6129a",
"assets/assets/icons/recommend.svg": "d6fe55f9b3d33f2ede984bf4a25461a4",
"assets/assets/icons/recoverloading.svg": "dbc6132bfe5c09b58a71e91582ea0f5d",
"assets/assets/icons/rectangle_1.svg": "e24f82d34bac9b83e2af0f85d6e4d596",
"assets/assets/icons/refresh.svg": "dd02a752440b6f61016a44dad6942ff3",
"assets/assets/icons/refresh2.svg": "6e11933636cf9b42e7d73ca842abd89d",
"assets/assets/icons/reload.svg": "b09d8795256918bfb4582e4bdc8ed3ae",
"assets/assets/icons/reload_2.svg": "5f2035173419c91f1c338ab32a332ae1",
"assets/assets/icons/reorder.svg": "8f89cd813280a474f2df9a3883e1b15e",
"assets/assets/icons/repeat.svg": "d7a2b583de0045e1eaf88ccdfbde300e",
"assets/assets/icons/residency.svg": "3a2bb2ecfbe53877b3ba6a7a79569b67",
"assets/assets/icons/rotate_right.svg": "079bc091bffc5316a30d8bdf101eae70",
"assets/assets/icons/roundstar.svg": "fe5e2b13eca277df2f5c93ba5d5d48b7",
"assets/assets/icons/scale.svg": "6a7999bde1c959718ee75871b9a378e7",
"assets/assets/icons/scan.svg": "5ed6d9d286c96225683096043e0a2f9e",
"assets/assets/icons/schedule_list.svg": "ed404431e68d7ebe0c7058ac64befbf3",
"assets/assets/icons/search.svg": "19170b5f6fa1f65d5b147c38720f4306",
"assets/assets/icons/send.svg": "6992fd0522e5a35adc1a14c39fa2addf",
"assets/assets/icons/send_mail.svg": "b0364263d1406ae28a7cf27437cb21c8",
"assets/assets/icons/setting.svg": "9f921618c040e6b6c41eb05b5b39ab3f",
"assets/assets/icons/share.svg": "47cef904be4fa04315ee35c0cf8cab45",
"assets/assets/icons/sharenetwork.svg": "1e8299e2eca1cf4be7f4acc3d1921ca6",
"assets/assets/icons/shield_done.svg": "c18fc34cbaded63b0ab447489dbb1bb7",
"assets/assets/icons/shield_fail.svg": "5fd4b61cb9ed89bd4a968a5cd682f244",
"assets/assets/icons/shift.svg": "66fbe8a11cecf9ed224a950b24ac75f8",
"assets/assets/icons/shoes.svg": "207d0299d5c944915ba158a9f8436c84",
"assets/assets/icons/shoppingbag.svg": "e7d39129bb804c6fda0571bfb562ed63",
"assets/assets/icons/shopping_bag.svg": "40a7bd80b5ea192636e7a803c3835b2c",
"assets/assets/icons/sign.svg": "1ababdaa70ffc0d9d8fec43f2346ce34",
"assets/assets/icons/signout.svg": "a7e5b8b40b13a7b4670dc75732e412bb",
"assets/assets/icons/siren.svg": "730c8e92c719b4dd40b1f47b1c4eaf8d",
"assets/assets/icons/slashforward.svg": "0872c3b314350387d8c1c04a3e76503b",
"assets/assets/icons/sliders.svg": "173ca61025a56c5ead2608061ee24668",
"assets/assets/icons/solid.svg": "69954ccfc1f69eee3700942d916ba34f",
"assets/assets/icons/sort.svg": "1ab7103f9929bd69d16d6adad3d1a6ab",
"assets/assets/icons/sorting.svg": "a9ce3082453c59103f5a2e949c51f530",
"assets/assets/icons/sort_ascending.svg": "0793d96f7346082422465e56bcd000d7",
"assets/assets/icons/sort_decending.svg": "91dab3a5834eb4d4f97bf07e3a1b53d1",
"assets/assets/icons/sort_default.svg": "c168b3c499403e2ba1c3117b6aa3d06e",
"assets/assets/icons/star.svg": "b57d276a1ea9c70f2e575ff11a6e4f53",
"assets/assets/icons/step.svg": "072dda4aaf42e472c5a7238c05691ca0",
"assets/assets/icons/stroke.svg": "112bfd5f725edaf306a35d88e9adf93c",
"assets/assets/icons/swap.svg": "c198deb83a65ede00ed18acdc087c1fc",
"assets/assets/icons/switch_icon.svg": "26b53b45a207acbdf43fe77f4a46ce27",
"assets/assets/icons/task.svg": "b140843ed4b9e5d990440c890e22b327",
"assets/assets/icons/temperature.svg": "ac5e00617d0b9c4dae970a66fef2e4f1",
"assets/assets/icons/text.svg": "1d7f66f89193d3d4e0cb1096e5cb6de0",
"assets/assets/icons/ticket.svg": "0a2f7652da994807e41cab3a4ea2059f",
"assets/assets/icons/ticket_star.svg": "166411095bf6fe52ce1b15000d6b77c0",
"assets/assets/icons/time.svg": "76aff64a24e8e498f63066ca0ac9401b",
"assets/assets/icons/timer.svg": "42fd6998dfb663d2ca23f59ca076b456",
"assets/assets/icons/time_circle.svg": "76aff64a24e8e498f63066ca0ac9401b",
"assets/assets/icons/today.svg": "d485c1333c06254201b5ac66e2558a43",
"assets/assets/icons/trash.svg": "8b4d9cdc675cc791ed967492ed5a1a09",
"assets/assets/icons/twotone_icons.svg": "1ffc6a0eefd166430c420f5dbe0f3cf6",
"assets/assets/icons/two_user.svg": "5a381897c3a9d05d3d596569ec9a09b9",
"assets/assets/icons/type.svg": "96a70737d2e374dd8dfc414d715b1a6a",
"assets/assets/icons/unavailable.svg": "476702d52c445f1fa21ac61dc4734457",
"assets/assets/icons/underline.svg": "73594a5871def83357f14342700b509b",
"assets/assets/icons/unlock.svg": "f11aeac7f60b0a0c6e8a39cf7118aa5a",
"assets/assets/icons/upload.svg": "7f26e41cfe6a996c9c033653afcd6ef4",
"assets/assets/icons/user_off.svg": "5d26489461c9379fbce69863d462ea52",
"assets/assets/icons/user_on.svg": "090b3607c2bba04af29ab569e51b1816",
"assets/assets/icons/vector.svg": "bc0b7a6cc8cfd6e103720b2f557c4c70",
"assets/assets/icons/vest.svg": "d50137c5f03eed2772940c1d5615b34b",
"assets/assets/icons/vibrate.svg": "cfa3a89392f8c3def019187b4b69aec1",
"assets/assets/icons/video.svg": "1a06c16cae58cce218a37bf195d90f1a",
"assets/assets/icons/video_off.svg": "378003c28cf38e2150a96e3c693fbaf2",
"assets/assets/icons/visa.svg": "4e669585e2de02bf576f51e466b290fa",
"assets/assets/icons/voice.svg": "fe350a296a290e58d9343d4cffe8c2e8",
"assets/assets/icons/volume_up.svg": "e3461d71d8e9e07170cb1bb027a03552",
"assets/assets/icons/white.svg": "4337cd058e87b6a083fd5588ded9cecf",
"assets/assets/icons/work.svg": "bbce115058050801e94f821ba673d96f",
"assets/assets/icons/yes.svg": "974b7ce4b25bad84c3c06f95761ec85f",
"assets/assets/icons/zoom__up.svg": "6542d8b6931e503c5c93ed41ce01e5db",
"assets/assets/images/cbe.png": "4339c58107fa6b9fc8115e7707a6c78c",
"assets/assets/images/cv1.png": "26345c81a574fbc5e667ec0dfb595222",
"assets/assets/images/cv3.jpg": "580480c34deb4295975c4eee69b3458a",
"assets/assets/images/cv4.jpg": "4c442477270ff308f3a1b22e44eb0dba",
"assets/assets/images/cv5.jpg": "314d1d8c269c644260b77da7eb532919",
"assets/assets/images/qrcode.png": "9a9d2e09482abab40b1f253f8f8923d1",
"assets/assets/images/telebirr.png": "cc0722a142b7588589137ec9ca4cb1a0",
"assets/assets/logos/logo.png": "34832da6958a0a868389adfbf8ef25fb",
"assets/assets/lottie/submit_animation.json": "44f56119f7ccca077f7589918ed66341",
"assets/FontManifest.json": "e6bf7d75b1e27da19cb64f0b09f81025",
"assets/fonts/MaterialIcons-Regular.otf": "6fbee4d8d8ab392e604d0b0c1e2eb75b",
"assets/NOTICES": "f47c41eea7aa5a73ee6d97937ed93904",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "b7494490812ea0b4c2cbb3969019be96",
"canvaskit/canvaskit.wasm": "1febcf3fdbbfb632728ab3902c386b44",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "9961e966e98a802d73942d48b15b86e7",
"canvaskit/chromium/canvaskit.wasm": "407d7dd73b05e38e5cafa7b789e22feb",
"canvaskit/skwasm.js": "ede049bc1ed3a36d9fff776ee552e414",
"canvaskit/skwasm.js.symbols": "6c749208f75e81d9628fa894d73bfbdc",
"canvaskit/skwasm.wasm": "a2021418f5cb63318cbe273e2e75f877",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f89db28227ec48576c4247890b4446f8",
"flutter_bootstrap.js": "63a7db88f9faaab665e69eb43df97c32",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "152ffdbd51e250650c82fbd8752ae011",
"/": "152ffdbd51e250650c82fbd8752ae011",
"main.dart.js": "3ba11fb2a76c7dc743ce96760f91a213",
"manifest.json": "0834600f8ffd39f00d91f22760cb8d96",
"version.json": "827e94e039cb5748d82c0f6bbf87a22e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
