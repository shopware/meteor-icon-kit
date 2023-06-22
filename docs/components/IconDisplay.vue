<template>
<div class="icon-container">
  <div class="icon-display">
    <img :id="id" :src="withBase(icon.path)" :alt="icon.name" @click="copyIconName"/>
  </div>

  <p>{{ icon.name }}</p>
</div>
</template>

<script setup>
import {defineProps, computed} from 'vue';
import {withBase} from 'vitepress';

const props = defineProps({
  icon: Object,
})

const copyIconName = () => {
  const tempTextArea = document.createElement('textarea');
  tempTextArea.value = `${props.icon.regular ? 'regular-' : 'solid-'}${props.icon.name}`;
  document.body.appendChild(tempTextArea);
  tempTextArea.select();
  document.execCommand('copy');
  document.body.removeChild(tempTextArea);
}

const id = computed(() => {
  return `meteor-icon-kit__${props.icon.regular ? 'regular-' : 'solid-'}${props.icon.name}`;
});
</script>

<style lang="css" scoped>
.icon-container {
  text-align: center;
  font-size: 13px;
  position: relative;
  width: 116px;
}

.icon-container p {
  margin: 0;
}

.icon-display {
  display: flex;
  width: 100%;
  height: 116px;
  border-radius: 8px;
  justify-content: center;
  align-items: center;
  box-shadow: 0 1px 1px rgb(0 0 0 / 8%), 0 2px 1px rgb(0 0 0 / 6%), 0 1px 3px rgb(0 0 0 / 10%);
}

img {
  cursor: pointer;
}
</style>
