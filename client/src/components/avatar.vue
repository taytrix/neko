<template>
  <div>
    <!-- Render custom avatar if applicable -->
    <avatar-custom
      v-if="isCustomAvatar"
      :seed="seed"
      :size="size"
    />

    <!-- Fallback to the original avatar rendering -->
    <div
      v-else
      class="avatar"
      :style="{
        width: size + 'px',
        height: size + 'px',
        lineHeight: size + 'px',
        fontSize: size / 2 + 'px',
        backgroundColor: Background(seed),
      }"
    >
      {{ seed.substring(0, 2).toUpperCase() }}
    </div>
  </div>
</template>

<style lang="scss" scoped>
.avatar {
  user-select: none;
  text-align: center;
  background: white;
  color: black;
  display: inline-block;
  overflow: hidden;
  border-radius: 50%;
}
</style>

<script lang="ts">
import { Vue, Component, Prop } from 'vue-property-decorator'
import AvatarCustom from './avatar-custom.vue'

@Component({
  name: 'neko-avatar',
  components: {
    'avatar-custom': AvatarCustom,
  },
})
export default class extends Vue {
  @Prop(String) readonly seed: string | undefined
  @Prop(Number) readonly size: number | undefined

  // Computed property to determine if the avatar should be custom
  get isCustomAvatar(): boolean {
    const name = this.seed ? this.seed.toLowerCase() : ''
    return ['tay', 'v', 'olive', 'troy'].includes(name)
  }

  // Existing Background method remains unchanged
  Background(seed: string): string {
    let a = 0,
      b = 0,
      c = 0

    for (let i = 0; i < seed.length; i++) {
      a += seed.charCodeAt(i) * 3
      b += seed.charCodeAt(i) * 5
      c += seed.charCodeAt(i) * 7
    }

    const x = Math.floor(128 + (a % 128))
    const y = Math.floor(128 + (b % 128))
    const z = Math.floor(128 + (c % 128))
    return `rgb(${x}, ${y}, ${z})`
  }
}
</script>
