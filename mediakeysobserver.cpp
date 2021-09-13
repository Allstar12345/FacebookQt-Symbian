#include "mediakeysobserver.h"

MediaKeysObserver::MediaKeysObserver(QObject *parent) : QObject(parent)
{
    interfaceSelector = CRemConInterfaceSelector::NewL();
    coreTarget = CRemConCoreApiTarget::NewL(*interfaceSelector, *this);
    interfaceSelector->OpenTargetL();
}

MediaKeysObserver::~MediaKeysObserver()
{
    delete interfaceSelector;
}

void MediaKeysObserver::MrccatoCommand(TRemConCoreApiOperationId operationId,
                                       TRemConCoreApiButtonAction buttonAct)
{
    switch (operationId) {
    case ERemConCoreApiPausePlayFunction:
        if (buttonAct == ERemConCoreApiButtonClick)
            emit mediaKeyClicked(MediaKeysObserver::EPlayPauseKey);
        break;

    case ERemConCoreApiStop:
        if (buttonAct == ERemConCoreApiButtonClick)
            emit mediaKeyClicked(MediaKeysObserver::EStopKey);
        break;

    case ERemConCoreApiRewind:
        if (buttonAct == ERemConCoreApiButtonClick)
            emit mediaKeyClicked(MediaKeysObserver::EFastRewindKey);
        break;

    case ERemConCoreApiForward:
        if (buttonAct == ERemConCoreApiButtonClick)
            emit mediaKeyClicked(MediaKeysObserver::EForwardKey);
        break;

    case ERemConCoreApiVolumeUp:
        if (buttonAct == ERemConCoreApiButtonClick)
            emit mediaKeyClicked(MediaKeysObserver::EVolIncKey);
        else if (buttonAct == ERemConCoreApiButtonPress)
            emit mediaKeyPressed(MediaKeysObserver::EVolIncKey);
        else if (buttonAct == ERemConCoreApiButtonRelease)
            emit mediaKeyReleased(MediaKeysObserver::EVolIncKey);
        break;

    case ERemConCoreApiVolumeDown:
        if (buttonAct == ERemConCoreApiButtonClick)
            emit mediaKeyClicked(MediaKeysObserver::EVolDecKey);
        else if (buttonAct == ERemConCoreApiButtonPress)
            emit mediaKeyPressed(MediaKeysObserver::EVolDecKey);
        else if (buttonAct == ERemConCoreApiButtonRelease)
            emit mediaKeyReleased(MediaKeysObserver::EVolDecKey);
        break;

    case ERemConCoreApiFastForward:
        if (buttonAct == ERemConCoreApiButtonClick)
            emit mediaKeyClicked(MediaKeysObserver::EFastForwardKey);
        else if (buttonAct == ERemConCoreApiButtonPress)
            emit mediaKeyPressed(MediaKeysObserver::EFastForwardKey);
        else if (buttonAct == ERemConCoreApiButtonRelease)
            emit mediaKeyReleased(MediaKeysObserver::EFastForwardKey);
        break;

    case ERemConCoreApiBackward:
        if (buttonAct == ERemConCoreApiButtonClick)
            emit mediaKeyClicked(MediaKeysObserver::EBackwardKey);
        else if (buttonAct == ERemConCoreApiButtonPress)
            emit mediaKeyPressed(MediaKeysObserver::EBackwardKey);
        else if (buttonAct == ERemConCoreApiButtonRelease)
            emit mediaKeyReleased(MediaKeysObserver::EBackwardKey);
        break;

    default:
        break;
    }
}

