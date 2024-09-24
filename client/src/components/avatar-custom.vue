<template>
    <div
      class="avatar"
      :style="customAvatarStyles"
    ></div>
  </template>
  
  <style lang="scss" scoped>
  .avatar {
    user-select: none;
    text-align: center;
    background: white; /* This will be overridden by backgroundImage */
    color: black;
    display: inline-block;
    overflow: hidden;
    border-radius: 50%;
  }
  </style>
  
  <script lang="ts">
  import { Vue, Component, Prop } from 'vue-property-decorator'
  
  @Component({
    name: 'avatar-custom',
  })
  export default class AvatarCustom extends Vue {
    @Prop({ type: String, required: true }) readonly seed!: string
    @Prop({ type: Number, required: true }) readonly size!: number
  
    // Computed property to get the custom avatar URL based on the seed
    get customAvatarUrl(): string | null {
      const name = this.seed.toLowerCase()
      switch (name) {
        case 'tay':
          return '@/assets/images/avatars/tay.jpg'
        case 'v':
          return '@/assets/images/avatars/v.jpg'
        case 'olive':
          return '@/assets/images/avatars/olive.jpg'
        case 'troy':
          return '@/assets/images/avatars/troy.jpg'
        default:
          return null
      }
    }
  
    // Computed property for custom avatar styles
    get customAvatarStyles() {
      return {
        width: `${this.size}px`,
        height: `${this.size}px`,
        backgroundImage: `url(${this.customAvatarUrl})`,
        backgroundSize: 'cover',
        backgroundPosition: 'center',
        backgroundColor: 'transparent', // Remove background color for custom avatars
      }
    }
  }
  </script>