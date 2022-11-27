const CLICK = "click";

export function useClick() {
  const listeners = [];

  function addListener(listener) {
    const listenerIndex = listeners.length;
    listeners.push(listener);
    window.addEventListener(CLICK, listener);
    return listenerIndex;
  }

  function removeListener(listenerIndex) {
    if (!listeners[listenerIndex]) return;

    window.removeEventListener(CLICK, listeners[listenerIndex]);
    listeners.splice(listenerIndex, 1);
  }

  function removeAllListeners() {
    listeners.forEach((listener) => {
      window.removeEventListener(CLICK, listener);
    });
  }

  return { addListener, removeListener, removeAllListeners };
}
