SDK 가이드
==========

PallyCon SDK는 NCG DRM을 사용하여 모든 타입의 Content에 DRM 서비스를 적용시킬 수 있는 SDK입니다. 

 
## Who should use 'PallyCon SDK'?

**PallyCon SDK는 업체가 이미 서비스 중인 앱에 DRM을 적용하는데 가장 쉽고, 간편한 DRM 솔루션입니다.** 
뿐만 아니라, **PallyCon SDK는 모든 콘텐츠에 NCG DRM 기술을 적용할 수 있는 PallyCon의 특징에 가장 잘 부합하는 솔루션입니다.**  
 
PallyCon SDK를 사용해야 하는 업체은 다음과 같습니다.  

- 음원/동영상 Contents가 아닌 기타 Contents를 DRM Service하려는 업체 
- PallyCon Service에서 제공하는 음원/동영상 Player가 아닌 전용 Player를 만들려는 업체 
- PallyCon On-premise Server를 사용하려는 업체

PallyCon SDK는 PallyCon Cloud Service와 PallyCon On-premise Server에 모두 호환됩니다.   
하지만, PallyCon PC/Mobile Player는 PallyCon Cloud Service만 호환이 되기 때문에, PallyCon On-premise Server를 사용하고자 하는 업체는 반드시 PallyCon SDK를 사용하셔야만 합니다.

| |Video/Music Contents    |Other Contents              |PallyCon Cloud Service  |PallyCon On-premise Server  |
|---|---|---|---|---| 
|PallyCon PC/Mobile Player |Support                 |NOT Support                 | |Support                 | 
|PallyCon SDK              |Support                 |Support                     | |Support | 


 
## PallyCon SDK에서 제공하는 기능

PallyCon SDK에서 제공하는 기능은 다음과 같습니다. 

### 개발의 편의를 위한 기능

- 현재 서비스 중인 앱에 쉽고 간편하게 적용이 가능한 추상화된 함수와 적용 시나리오 제공
- NCG DRM이 적용된 모든 Content를 Un-packaging하는 기능 제공
- 크기가 큰 Content를 효과적으로 사용하기 위한 부분 복호화 기능 제공

### Content 보안을 위한 기능

- 기간제 Content를 안전하게 사용하기 위한 다양한 보안 설정 기능 제공
- Content 보호를 위해 외부 출력 제한, 스크린샷 제한(Android) 기능 제공
- License에 의한 DRM Content 사용 보장을 위한 다양한 기능 제공  




 
## PallyCon SDK 사양

PallyCon SDK는 Windows, Android, iOS SDK를 제공합니다. 

PallyCon SDK의 각 플랫폼별 사양은 다음과 같습니다. 

| |PallyCon Windows SDK  |PallyCon Android SDK  |PallyCon iOS SDK  |
|----------|----------|----------|----------|
|Support Spec.|XP or above (Visual Studio 2008 or above)|2.3 version or above  |iOS 6.0 or above (iPad2, iPhone4 or above)|


 
##PallyCon SDK 적용

- STEP1. 원본 콘텐츠가 문제없이 구동되는 앱을 먼저 만듭니다.

- STEP2. PallyCon SDK 샘플을 통해 SDK 적용 방법과 DRM Content 사용 방법을 익힙니다.

- STEP3. DRM Service 정책과 시나리오를 결정합니다.

- STEP4. License Server를 구축하고, DRM Content 생성에 필요한 페이지와 License 발급에 필요한 페이지를 DRM Service 정책에 맞게 개발합니다. 

-  STEP5. 앱에 PallyCon SDK를 추가합니다.

- STEP6. 앱에 DRM Service를 적용합니다.