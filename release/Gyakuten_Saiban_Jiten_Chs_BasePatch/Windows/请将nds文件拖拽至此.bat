@echo off
%~d0
cd %~dp0
if "%~1" == "" (
@echo �뽫������հ�rev0��rev1ԭ��rom��ק�����ļ���
pause
goto :eof
)
@echo �������ZX�����١�v1.14 �������� by ������������
@echo ������֧���հ�rev0��rev1����rom���ֱ����ɶ�Ӧ�ĺ���rom����ע������rom�浵�������ݡ�
@echo ʹ��ʱ���뽫rom���뱾���򣬽����Զ�ʶ��汾���������ʧ�ܣ���ȷ��У��ֵ��
@echo (���ʽ���)rom���˴�ָnds��Ϸ�ļ����Ϲ�����Ϊ������nds��������ȡ�����ģ���׺ͨ��Ϊ.nds���ļ���
@echo ===========================================
@echo �հ�rev0У��ֵ��
@echo CRC32: 89c919bc
@echo MD5  : 396ab0f79547b774ad51d934c7710fea
@echo SHA1 : e0b869b83fe6b56ee11d2fe53a6464fae50303c1
@echo ===========================================
@echo �հ�rev1У��ֵ��
@echo CRC32: 6b256b2a
@echo MD5  : fddde92dd86fc96e674e22d0b08b9f1f
@echo SHA1 : b059109fa7a450eabe8a70d6e2f1be4c507605b2
@echo ===========================================

@echo ���ڼ�鲹���������ԣ����Ժ󡭡�
if not exist "..\RockmanZXAdvent_Chs_rev0.xdelta" (
    if not exist "..\RockmanZXAdvent_Chs_rev1.xdelta" (
        @echo rev0��rev1��xdelta�����ļ��������ڣ�
        @echo �����Ƿ�������ѹ�������������Ƿ�Ķ���xdelta�����ļ���λ�ã�
        @echo ��رձ����ڡ�
        @echo ===========================================
        pause
        goto :eof
    )
    @echo rev0��xdelta�����ļ������ڣ�
    @echo �����Ƿ�������ѹ�������������Ƿ�Ķ���xdelta�����ļ���λ�á�
    @echo ��رձ����ڡ�
    @echo ===========================================
    pause
    goto :eof
)
if not exist "..\RockmanZXAdvent_Chs_rev1.xdelta" (
    @echo rev1��xdelta�����ļ������ڣ�
    @echo �����Ƿ�������ѹ�������������Ƿ�Ķ���xdelta�����ļ���λ�á�
    @echo ��رձ����ڡ�
    @echo ===========================================
    pause
    goto :eof
)
@echo �����������Լ��ͨ����������ʼӦ�ò�����
@echo ===========================================

@echo ���ڳ���Ӧ��rev0���������У����Ժ󡭡�
@echo off
".\xdelta3-3.1.0-i686.exe" -d -f -s "%~1" "..\RockmanZXAdvent_Chs_rev0.xdelta" ".\RockmanZXAdvent_Chs_rev0.nds"
if %errorlevel% NEQ 0 (
    @echo rev0����Ӧ��ʧ�ܣ���ȷ�������հ�rev0 rom��У��ֵ��
    @echo ===========================================
    @echo ���ڳ���Ӧ��rev1���������У����Ժ󡭡�
    ".\xdelta3-3.1.0-i686.exe" -d -f -s "%~1" "..\RockmanZXAdvent_Chs_rev1.xdelta" ".\RockmanZXAdvent_Chs_rev1.nds"
) else (
    @echo ����rom�汾Ϊ�հ�rev0����Ϊ�����ɶ�Ӧ�ĺ���rom��
    @echo ���"RockmanZXAdvent_Chs_rev0.nds"��
    @echo ��رձ����ڡ�
    @echo ===========================================
    pause
    goto :eof
)

if %errorlevel% NEQ 0 (
    @echo rev1����Ӧ��ʧ�ܣ���ȷ�������հ�rev1 rom��У��ֵ��
    @echo ===========================================
    @echo ����ʹ�õ���Ϸrom�汾���ȷ��հ�rev0��Ҳ���հ�rev1��
    @echo ��ʹ����ȷ��rom�汾��Ӧ�ò�����
    @echo ��رձ����ڡ�
    @echo ===========================================
    pause
) else (
    @echo ����rom�汾Ϊ�հ�rev1����Ϊ�����ɶ�Ӧ�ĺ���rom��
    @echo ���"RockmanZXAdvent_Chs_rev1.nds"��
    @echo ��رձ����ڡ�
    @echo ===========================================
    pause
)