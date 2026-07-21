# Project Overview

## Problem Statement

Undetected water leaks behind washing machines or under kitchen sinks can cause significant damage before anyone notices. This is a common enough problem that dedicated commercial leak alarms (e.g. Flood Buzz, SABRE) already exist for exactly this function — an indicator of a real, everyday need. Rather than buying a sealed commercial unit, this project builds the same core function — conductivity-based water detection with an audible buzzer alarm — from individual components, so learners understand the electronics behind it.

## بيان المشكلة

تسرّبات المياه غير المكتشفة خلف الغسالات أو تحت أحواض المطبخ يمكن أن تسبب أضرارًا كبيرة قبل أن ينتبه لها أحد. هذه مشكلة شائعة لدرجة أن أجهزة إنذار تجارية مخصصة لها (مثل Flood Buzz وSABRE) موجودة بالفعل — وهو مؤشر على حاجة حقيقية ويومية. بدلاً من شراء جهاز تجاري مغلق، يبني هذا المشروع الوظيفة الأساسية نفسها — كشف المياه بالاعتماد على التوصيلية الكهربائية مع إنذار صوتي (buzzer) — من مكونات فردية، حتى يفهم المتعلم الإلكترونيات الكامنة خلفها.

## Project Goal

Design and build a simple analog circuit that detects water via two conductive probes and sounds a buzzer, replicating the core function of commercial leak alarms. The project demonstrates the complete development flow of an electronic device — LTspice simulation, breadboard and soldered perfboard prototype, KiCad schematic and PCB layout up to a fab-ready design presented as a 3D render. As in every MawjaLab project, one focus topic is taught in depth — here: resistors and resistive (conductive) behavior — while all other stages are explained only as far as needed to follow the circuit.

## هدف المشروع

تصميم وبناء دائرة تناظرية (analog) بسيطة تكشف وجود الماء عبر مسبارين موصّلين (probes) وتُصدر إنذارًا صوتيًا عبر buzzer، بحيث تحاكي الوظيفة الأساسية لأجهزة الإنذار التجارية. يعرض المشروع مسار التطوير الكامل لجهاز إلكتروني — محاكاة في LTspice، نموذج أولي على breadboard ثم ملحوم على perfboard، ثم رسم الـ schematic وتصميم الـ PCB في KiCad وصولًا إلى تصميم جاهز للتصنيع يُعرض كـ 3D render. ومثل كل مشاريع MawjaLab، يُشرح موضوع محوري واحد بعمق — هنا: المقاومات والسلوك المقاوم/الموصل (resistive/conductive) — بينما تُشرح بقية المراحل بالقدر اللازم لفهم الدائرة فقط.

## Learning Objective

After this project, the viewer should understand how resistance and conductivity behave in a real circuit: water itself acting as a conductor, the water/probe path forming a variable sensing resistance, and the fixed resistors around it — above all the divider partner that turns that variable resistance into a usable voltage, plus resistors that set defined currents and default states elsewhere in the circuit. The exact resistor line-up depends on the chosen topology and is confirmed at the schematic phase — it is deliberately not fixed here. The remaining stages (the switching element, the buzzer drive) are introduced with a brief functional explanation but not covered in depth — each of them can become the focus topic of another project. The throughline of this episode is: resistance and conductive behavior, and what each resistor in this circuit does.

## الهدف التعليمي

بعد هذا المشروع، يجب أن يفهم المشاهد كيف تتصرف المقاومة والتوصيلية في دائرة حقيقية: الماء نفسه كموصل، ومسار الماء/المسبارين كمقاومة استشعار متغيرة، والمقاومات الثابتة المحيطة بها — وفي مقدمتها المقاومة المكمّلة لمجزّئ الجهد (voltage divider) التي تحوّل تلك المقاومة المتغيرة إلى جهد قابل للاستخدام، إضافة إلى مقاومات تضبط تيارات محددة وحالات افتراضية في بقية الدائرة. التشكيلة الدقيقة للمقاومات تعتمد على بنية الدائرة المختارة وتُثبَّت في مرحلة الـ schematic — ولا تُحدَّد هنا عمدًا. أما المراحل الأخرى (عنصر الـ switching، وقيادة الـ buzzer) فتُقدَّم بشرح وظيفي موجز دون تفصيل — وكل منها يمكن أن يكون الموضوع المحوري لمشروع آخر. الخيط الرئيسي لهذه الحلقة هو: المقاومة والسلوك الموصل، ودور كل مقاومة في هذه الدائرة.

## Target Audience

- [x] Electronics beginners
- [x] Students
- [x] Makers
- [ ] Embedded developers
- [ ] Hardware developers

## الفئة المستهدفة

- [x] مبتدئو الإلكترونيات
- [x] طلاب
- [x] هواة الصنع
- [ ] مطورو الأنظمة المدمجة
- [ ] مطورو الأجهزة

## Project Type

- [x] Hardware
- [ ] Software
- [ ] Hardware and software

## نوع المشروع

- [x] عتاد
- [ ] برمجيات
- [ ] عتاد وبرمجيات

## Expected Result

The working principle is shown in three forms, in this order:

1. **LTspice simulation** — the detection and alarm behavior, *simulated*.
2. **Physical prototype** — built on a breadboard, then as a soldered perfboard version: powered from AA cells (exact count, e.g. 2×AA = 3 V, fixed during component selection), two exposed probes, one buzzer. The buzzer sounds as soon as water bridges the probes and stops once they dry out; whether a latching variant with a manual reset switch is added is decided in the requirements/architecture phase. All measurements and the final validation happen on this prototype (*measured*, *validated*).
3. **KiCad design** — schematic and 2-layer PCB layout, DRC-clean and fab-ready, presented as a 3D render. No PCB is fabricated in v1: the board design is *inspected* (design review, DRC) but not physically validated. Fabrication is a candidate for a v2.

No enclosure, no microcontroller, no connectivity.

## النتيجة المتوقعة

يُعرض مبدأ العمل بثلاثة أشكال وبهذا الترتيب:

1. **محاكاة LTspice** — سلوك الكشف والإنذار، *محاكاةً* (simulated).
2. **نموذج أولي مادي** — يُبنى على breadboard أولًا، ثم كنسخة ملحومة على perfboard: يعمل ببطاريات AA (العدد الدقيق، مثل 2×AA = 3V، يُثبَّت في مرحلة اختيار المكونات)، مع مسبارين مكشوفين وbuzzer واحد. يصدر الصوت فور ملامسة الماء للمسبارين ويتوقف عند جفافهما؛ أما إضافة نسخة تثبيت الإنذار (latching) مع زر إعادة ضبط يدوي فقرار يُتَّخذ في مرحلة المتطلبات/بنية النظام. جميع القياسات وعملية التحقق النهائية تتم على هذا النموذج (*measured*، *validated*).
3. **تصميم KiCad** — رسم schematic وتخطيط PCB بطبقتين، خالٍ من أخطاء DRC وجاهز للتصنيع، يُعرض كـ 3D render. لا تُصنَّع أي لوحة في الإصدار الأول: تصميم اللوحة *مفحوص* (مراجعة تصميم + DRC) لكنه غير مُتحقَّق منه ماديًا. التصنيع مرشَّح لإصدار ثانٍ.

بدون غطاء (enclosure)، بدون متحكم دقيق (microcontroller)، وبدون اتصال.

## Constraints

- **Budget**: < €3 in parts per prototype (components + perfboard, excluding battery and tools). No PCB fabrication in v1, therefore no fab or shipping costs.
- **Timeframe**: 2 weeks — feasible because no fabrication/shipping turnaround is in scope; the project ends at the fab-ready design and 3D render.
- **Available tools**: lab power supply and soldering iron on hand. A multimeter is required from the breadboard phase onward and is purchased before that phase starts (blocking); an oscilloscope will be purchased in the same window but is not blocking for this project.
- **Manufacturing options**: no fabrication in v1. The layout still targets standard low-cost 2-layer fab capabilities so it could be ordered unchanged in a v2; vendor selection is deferred until then.
- **Relevant standards**: no product standard mandated; IPC-2221 (generic printed board design) is used as the guideline for the PCB layout.

## القيود

- **الميزانية**: أقل من 3 يورو للقطع لكل نموذج (المكونات + perfboard، من دون البطارية والأدوات). لا يوجد تصنيع PCB في الإصدار الأول، وبالتالي لا توجد تكاليف تصنيع أو شحن.
- **الإطار الزمني**: أسبوعان — قابل للتحقيق لأن تصنيع اللوحة وشحنها خارج النطاق؛ ينتهي المشروع عند التصميم الجاهز للتصنيع والـ 3D render.
- **الأدوات المتاحة**: مزود طاقة مخبري وكاوية لحام متوفران حاليًا. الـ multimeter مطلوب ابتداءً من مرحلة الـ breadboard ويُشترى قبلها (شرط مُلزم)؛ الـ oscilloscope سيُشترى في الفترة نفسها لكنه غير مُلزم لهذا المشروع.
- **خيارات التصنيع**: لا تصنيع في الإصدار الأول. مع ذلك يستهدف التخطيط قدرات التصنيع القياسية منخفضة التكلفة (طبقتان، قواعد تصميم قياسية) بحيث يمكن طلبه دون تغيير في إصدار ثانٍ؛ اختيار المورد مؤجل حتى ذلك الحين.
- **المعايير ذات الصلة**: لا يوجد معيار منتج مفروض؛ يُستخدم IPC-2221 (التصميم العام للوحات المطبوعة) كدليل إرشادي لتخطيط الـ PCB.

## Open Questions & Risks

- **Detection threshold**: the maximum probe resistance that must still trigger the alarm is undefined (tap water and distilled water differ by orders of magnitude in conductivity) — to be defined in the requirements phase.
- **Standby battery life**: no target yet; standby current drives the divider values and the choice of switching element more than anything else — to be defined in the requirements phase.
- **Reset behavior**: pure auto-reset vs. latching alarm with manual reset — decided at requirements/architecture, because it changes the circuit topology, not just schematic details.
- **Probe corrosion**: DC excitation causes electrolysis at the probes over time — a known limitation of conductivity sensing; accepted for v1 (bench demonstration), to be revisited for a v2.
- **Tool availability**: the multimeter must arrive before the breadboard phase; a late purchase blocks all measurements.

## الأسئلة المفتوحة والمخاطر

- **عتبة الكشف**: أقصى مقاومة للمسبارين يجب أن تُطلق الإنذار غير محددة بعد (ماء الصنبور والماء المقطر يختلفان في التوصيلية بمراتب كبيرة) — تُحدَّد في مرحلة المتطلبات.
- **عمر البطارية في وضع الاستعداد**: لا يوجد هدف بعد؛ تيار الاستعداد هو العامل الأكبر في تحديد قيم مجزّئ الجهد ونوع عنصر الـ switching — يُحدَّد في مرحلة المتطلبات.
- **سلوك إعادة الضبط**: auto-reset فقط أم إنذار مثبَّت (latching) مع زر يدوي — يُقرَّر في مرحلة المتطلبات/بنية النظام، لأنه يغيّر بنية الدائرة لا تفاصيل الـ schematic فقط.
- **تآكل المسبارين**: التغذية بتيار مستمر (DC) تسبب تحليلًا كهربائيًا (electrolysis) عند المسبارين مع الوقت — قيد معروف في الاستشعار بالتوصيلية؛ مقبول في الإصدار الأول (عرض مخبري)، ويُعاد النظر فيه في إصدار ثانٍ.
- **توفر الأدوات**: يجب توفر الـ multimeter قبل مرحلة الـ breadboard؛ تأخر شرائه يوقف جميع القياسات.
