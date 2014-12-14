#include "IoState.h"
#include "IoObject.h"

IoObject *IoPython_proto(void *state);
__declspec(dllexport)

void IoPythonInit(IoObject *context)
{
	IoState *self = IoObject_state((IoObject *)context);

	IoObject_setSlot_to_(context, SIOSYMBOL("Python"), IoPython_proto(self));

}
