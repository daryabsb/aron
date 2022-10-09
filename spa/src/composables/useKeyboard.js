const EVENT_NAME = "keydown";

export function useKeyboard() {
  const listeners = [] ;

  function addListener(listener) {
    const listenerIndex = listeners.length;
    listeners.push(listener);
    window.addEventListener(EVENT_NAME, listener);
    return listenerIndex;
  }

  function removeListener(listenerIndex) {
    if (!listeners[listenerIndex]) return;

    window.removeEventListener(EVENT_NAME, listeners[listenerIndex]);
    listeners.splice(listenerIndex, 1);
  }

  function removeAllListeners() {
    listeners.forEach((listener) => {
      window.removeEventListener(EVENT_NAME, listener);
    });
  }

  return { addListener, removeListener, removeAllListeners };
}
